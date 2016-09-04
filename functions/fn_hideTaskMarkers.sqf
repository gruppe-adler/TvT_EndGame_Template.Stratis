private ["_waitCondition", "_i"];
_mode = param [0,"UNDEFINED"];
_task = param [1, taskNull];


switch (_mode) do {
//MODE NOT DEFINED =============================================================
  case "UNDEFINED" : {
    diag_log "fn_hideTaskMarkers - ERROR: NO MODE DEFINED";
  };


//FIND OBJECTIVES MODE (SERVER ONLY) ===========================================
  case "FINDOBJS" : {
    if (!isServer) exitWith {diag_log "fn_hideTaskMarkers - WARNING: FINDOBJS MODE SHOULD BE CALLED ON SERVER ONLY."};
    waitUntil {!isNil "BIS_moduleHvtObjectivesInstance_initialized"};
    waitUntil {BIS_moduleHvtObjectivesInstance_initialized};
    sleep 10;

    _searchRadius = (sqrt (worldSize * worldSize)) max 10000;
    _worldCenter = [worldSize/2, worldSize/2];
    _allObjectives = nearestObjects [_worldCenter, ["ModuleHvtSimpleObjective_F"], _searchRadius];

    ACTIVEOBJECTIVES = [];
    {
      _isActive = (_x getvariable ["bis_modulehvtobjective_visible", 0]) isEqualType false;
      if (_isActive) then {ACTIVEOBJECTIVES pushBack _x};
    } forEach _allObjectives;

    publicVariable "ACTIVEOBJECTIVES";
    diag_log format ["fn_hideTaskMarkers_FINDOBJS - Active objectives found: %1", count ACTIVEOBJECTIVES];
  };


//HIDE PHASE 2 MARKERS =========================================================
  case "PHASE2" : {
    waitUntil {!isNil "GAMEPHASE"};
    if (GAMEPHASE == 3) exitWith {};
    if (!hasInterface) exitWith {};
    if (isNil "EXACTINTELPOSITIONS") then {EXACTINTELPOSITIONS = true};
    if (EXACTINTELPOSITIONS) exitWith {};

    waitUntil {!isNil "originalSide"};
    if (originalSide == "EAST") then {
      _waitCondition = compile "FOBESTOPF";
    } else {
      _waitCondition = compile "FOBESTBLU";
    };

    if (didJIP && _waitCondition) exitWith {
      diag_log "fn_hideTaskMarkers_PHASE2 - Player joined in progress after FOB has been established. Calling HIDE mode on all tasks.";
      {
        ["HIDE", _x] call mcd_fnc_hideTaskMarkers;
      } forEach (simpleTasks player);
    };

    //wait until FOB task has been completed and deleted
    waitUntil {call _waitCondition};
    waitUntil {count (simpleTasks player) == 0};

    if (isNil "ACTIVEOBJECTIVES") exitWith {diag_log "fn_hideTaskMarkers_PHASE2 - ERROR: ACTIVEOBJECTIVES IS NOT DEFINED"};

    for [{_i = 0}, {_i<(count ACTIVEOBJECTIVES)}, {_i = _i + 1}] do {
      waitUntil {count simpleTasks player > _i};
      ["HIDE", (simpleTasks player) select _i] call mcd_fnc_hideTaskMarkers;
    };

    diag_log format ["fn_hideTaskMarkers_PHASE2 - All phase 2 tasks hidden. %1 tasks total.", _i];
  };

//HIDE PHASE 3 DEFEND MARKER UNTIL UPLOAD HAS BEGUN ============================
  case "PHASE3" : {
    if (!hasInterface) exitWith {};
    if (isNil "DEFMARKERONUL") then {DEFMARKERONUL = false};
    if !(DEFMARKERONUL) exitWith {};
    waitUntil {!isNil "SCHEMATICSVISIBLE"};
    waitUntil {SCHEMATICSVISIBLE};
    waitUntil {(["GETDEFTASKID"] call mcd_fnc_hideTaskMarkers) != -1};

    //hide for the first time at start of phase 3
    diag_log "fn_hideTaskMarkers_PHASE3 - Phase 3 defense task found. Hiding.";
    _defTaskID = ["GETDEFTASKID"] call mcd_fnc_hideTaskMarkers;
    _defTask = (simpleTasks player) select _defTaskID;
    _originalDest = taskDestination _defTask;
    cancelSimpleTaskDestination _defTask;

    //keep hiding until enemy team has uploaded once
    _uploadIsKnown = false;
    while {!_uploadIsKnown} do {
      waitUntil {_dest = taskdestination _defTask; !isNil "_dest" || (missionNamespace getVariable "BIS_hvt_pickupInfo" select 2) == "Uploading"};

      if ((missionNamespace getVariable "BIS_hvt_pickupInfo" select 2) == "Uploading") then {

        _uploadingSide = missionNamespace getVariable "BIS_upload_side";
        if (isNil "_uploadingSide") exitWith {diag_log "fn_hideTaskMarkers_PHASE3 - _uploadingSide is nil."};
        if (_uploadingSide != side player) then {
          [["The enemy has started uploading."], ["Prevent it at all costs!"]] spawn mcd_fnc_formattedHint;
          player say "taskAssigned";
          _uploadIsKnown = true;
          _defTask setSimpleTaskDestination _originalDest;

        } else {
          diag_log "fn_hideTaskMarkers_PHASE3 - Players team is uploading.";
          cancelSimpleTaskDestination _defTask;
          waitUntil {(missionNamespace getVariable "BIS_hvt_pickupInfo" select 2) != "Uploading"}
        };

      } else {
        diag_log "fn_hideTaskMarkers_PHASE3 - No one is uploading, hiding defend task destination again.";
        cancelSimpleTaskDestination _defTask;
      };

    };
    diag_log "fn_hideTaskMarkers_PHASE3 - Player side now knows about enemy upload position. Done.";
  };


//FIND PHASE 3 DEFEND TASK =====================================================
  case "GETDEFTASKID" : {
    _return = -1;
    for [{_i=0}, {_i<count (simpleTasks player)}, {_i=_i+1}] do {
      if (taskType ((simpleTasks player) select _i) == "Defend") exitWith {_return = _i};
    };
    _return
  };


//FIND MATCHING OBJECTIVE MODE =================================================
  case "TASKOBJECTIVE" : {
    _taskName = ((str _task) splitString " ") select 1;
    _taskName = _taskName select [0, (count _taskName) -5];
    _return = call compile _taskName;
    _return
  };


//HIDE TASKS DESTINATION =======================================================
  case "HIDE" : {
    if (!hasInterface) exitWith {};
    cancelSimpleTaskDestination _task;

    _objective = ["TASKOBJECTIVE", _task] call mcd_fnc_hideTaskMarkers;
    _syncObjs = synchronizedObjects _objective;
    _exit = false;
    for [{_i=0}, {_i<(count _syncObjs)}, {_i=_i+1}] do {
      if (triggerType (_syncObjs select _i) != "") exitWith {};
      if (_i == (count _syncObjs)-1 && triggerType (_syncObjs select _i) == "") exitWith {_exit = true};
    };
    if (_exit) exitWith {diag_log format ["fn_hideTaskMarkers_HIDE - ERROR: NO TRIGGER SYNCHRONIZED TO %1 FOUND.", _objective]};

    _trigger = _syncObjs select _i;
    _markername = format ["taskmarker_%1", _objective];
    [_trigger, _markername, false] call mcd_fnc_triggerToMarker;
    _task setSimpleTaskDestination (getPos _trigger);

  };
};
