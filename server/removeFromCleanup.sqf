/*  Removes dead and important units from remains collector
*
*   executed via init.sqf on server
*/

_mcd_fnc_removeFromCleanUp = {
  _allUnits = allUnits;
  _noCleanupUnits = allDead;

  //find units with rank of at least Major
  {
    if (rankID _x >= 5) then {
      _noCleanupUnits pushBack _x;
    };
  } forEach allUnits;

  //remove units from cleanup
  removeFromRemainsCollector _noCleanupUnits;
};

//repeat, incase some units were not properly initialized the first time
[] call _mcd_fnc_removeFromCleanUp;
sleep 10;
[] call _mcd_fnc_removeFromCleanUp;
