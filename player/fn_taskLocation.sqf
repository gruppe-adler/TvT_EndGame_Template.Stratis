/*  Adds destinations to tasks (workaround for EndGame tasks only working with 3D markers)
*
*   executed via eventhandler in player\taskLocationEH.sqf
*/

private ["_objectiveFound"];
params ["_mode"];

//PRELOAD MODE - FINDS RANDOMIZERS AND OBJECTIVES
if (_mode == "PRELOAD") then {
  _searchRadius = 15000;

  //Find amount of active objectives
  _worldCenter = [worldSize/2, worldSize/2];
  allRandomizers = nearestObjects [_worldCenter, ["ModuleHvtObjectiveRandomiser_F"], _searchRadius];
  allObjectives = nearestObjects [_worldCenter, ["ModuleHvtSimpleObjective_F"], _searchRadius];

//MAIN MODE - ADDS TASK LOCATIONS
} else {
  if (isNil "allRandomizers" || isNil "allObjectives") exitWith {diag_log "fn_taskLocation - ERROR: RUN IN PRELOAD MODE ONCE BEFORE CALLING MAIN"};
  
  _activeRandomizerCount = 0;
  _activeObjectiveCount = 0;

  _activeObjectives = allObjectives;
  {
    _allSynced = synchronizedObjects _x;

    _objectiveFound = false;
    {
      if (_allSynced find _x != -1) then {
        _objectiveFound = true;
        _activeObjectives = _activeObjectives - [_x];
      };
    } forEach allObjectives;

    //if randomizer has a synced objective, count++
    if (_objectiveFound) then {_activeRandomizerCount = _activeRandomizerCount + 1};
  } forEach allRandomizers;

  _activeObjectiveCount = _activeRandomizerCount + (count _activeObjectives);
  diag_log format ["fn_taskLocation - Active objectives found: %1", _activeObjectiveCount];

  //Wait until all tasks have been created
  waitUntil {count simpleTasks player == _activeObjectiveCount};
  diag_log "fn_taskLocation - All tasks created. Adding destinations.";


  //Add destinations to tasks
  _tasks = player getVariable "bis_fnc_settasklocal_tasks";
  for [{_i=0},{_i<count _tasks},{_i=_i+1}] do {
    _task = _tasks select _i;
    _taskObjective = ([_task] call BIS_fnc_taskDestination) select 0;
    _taskDestination = getPos _taskObjective;
    (simpleTasks player select _i) setSimpleTaskDestination _taskDestination;
  };
};
