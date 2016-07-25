/*  Adds destinations to tasks (workaround for EndGame tasks only working with 3D markers)
*
*   executed via eventhandler in player\taskLocationEH.sqf
*/

//SERVER MODE - FINDS RANDOMIZERS AND OBJECTIVES
if (isServer) then {
  _searchRadius = (sqrt (worldSize * worldSize)) max 10000;
  _worldCenter = [worldSize/2, worldSize/2];

  /*allRandomizers = nearestObjects [_worldCenter, ["ModuleHvtObjectiveRandomiser_F"], _searchRadius];*/
  _allObjectives = nearestObjects [_worldCenter, ["ModuleHvtSimpleObjective_F"], _searchRadius];

  ACTIVEOBJECTIVES = [];
  {
    _isActive = (_x getvariable ["bis_modulehvtobjective_visible", 0]) isEqualType false;
    if (_isActive) then {ACTIVEOBJECTIVES pushBack _x};
  } forEach _allObjectives;

  publicVariable "ACTIVEOBJECTIVES";
  diag_log format ["hideTaskMarkers.sqf - Active objectives found: %1", count ACTIVEOBJECTIVES];

};

//CLIENT MODE - ADDS TASK LOCATIONS
if (hasInterface) then {
  //wait until FOB task has been completed and deleted
  waitUntil {!isNil "ACTIVEOBJECTIVES"};
  waitUntil {count (simpleTasks player) == 0};

  {
    [_x] spawn {
      private ["_trigger"];
      params ["_objective"];

      waitUntil {(_objective getvariable "bis_modulehvtobjective_revealedto") isEqualType []};
      waitUntil {(side player) in (_objective getvariable "bis_modulehvtobjective_revealedto")};
      _task = (simpleTasks player) select ((count simpleTasks player) -1);
      cancelSimpleTaskDestination _task;

      {
        if (triggerType _x != "") exitWith {_trigger = _x};
      } forEach (synchronizedObjects _taks);


    };
  } forEach ACTIVEOBJECTIVES;
};
