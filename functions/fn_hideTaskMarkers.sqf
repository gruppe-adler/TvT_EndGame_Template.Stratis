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

    _searchRadius = (sqrt (worldSize * worldSize)) max 10000;
    _worldCenter = [worldSize/2, worldSize/2];
    _allObjectives = nearestObjects [_worldCenter, ["ModuleHvtSimpleObjective_F"], _searchRadius];

    ACTIVEOBJECTIVES = [];
    {
      _isActive = (_x getvariable ["bis_modulehvtobjective_visible", 0]) isEqualType false;
      if (_isActive) then {ACTIVEOBJECTIVES pushBack _x};
    } forEach _allObjectives;

    publicVariable "ACTIVEOBJECTIVES";
    diag_log format ["fn_hideTaskMarkers - Active objectives found: %1", count ACTIVEOBJECTIVES];
  };


//WAIT MODE ====================================================================
  case "WAIT" : {
    waitUntil {!isNil "GAMEPHASE"};
    if (GAMEPHASE == 3) exitWith {};
    if (!hasInterface) exitWith {};

    waitUntil {!isNil "originalSide"};
    if (originalSide == "EAST") then {
      _waitCondition = compile "FOBESTOPF";
    } else {
      _waitCondition = compile "FOBESTBLU";
    };

    if (didJIP && _waitCondition) exitWith {
      diag_log "fn_hideTaskMarkers - Player joined in progress after FOB has been established. Calling HIDE mode on all tasks.";
      {
        ["HIDE", _x] call mcd_fnc_hideTaskMarkers;
      } forEach (simpleTasks player);
    };

    //wait until FOB task has been completed and deleted
    waitUntil {call _waitCondition};
    waitUntil {count (simpleTasks player) == 0};

    if (isNil "ACTIVEOBJECTIVES") exitWith {diag_log "fn_hideTaskMarkers - ERROR: ACTIVEOBJECTIVES IS NOT DEFINED"};

    _i = 0;
    while {count simpleTasks player < (count ACTIVEOBJECTIVES)+1} do {
      waitUntil {count simpleTasks player > _i};
      ["HIDE", (simpleTasks player) select _i] call mcd_fnc_hideTaskMarkers;
      _i = _i + 1;
    };

    diag_log format ["fn_hideTaskMarkers - All phase 2 tasks hidden. %1 tasks total.", _i];
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
    if (_exit) exitWith {diag_log format ["fn_hideTaskMarkers - ERROR: NO TRIGGER SYNCHRONIZED TO %1 FOUND.", _objective]};

    _trigger = _syncObjs select _i;
    _markername = format ["taskmarker_%1", _objective];
    [_trigger, _markername, false] call mcd_fnc_triggerToMarker;
    _task setSimpleTaskDestination (getPos _trigger);

  };
};
