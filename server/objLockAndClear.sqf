/*  Clears and locks all vehicle objectives
*
*   executed on server via init.sqf
*/

diag_log "objLockAndClear.sqf starting...";

_objVehicles = [];
_allFound = false;
_i = 1;
_notFoundCount = 0;

//find vehicle download objectives
while {!_allFound} do {
  _vehicleVar = "obj_download_" + (str _i);
  if (!isNil _vehicleVar) then {
    _notFoundCount = 0;
    _vehicleVar = call compile _vehicleVar;
    if (_vehicleVar isKindOf "landVehicle" || _vehicleVar isKindOf "Air" || _vehicleVar isKindOf "Boat") then {
      _objVehicles pushBack _vehicleVar;
    };
  } else {
    _notFoundCount = _notFoundCount + 1;
    if (_notFoundCount >= 20) then {
      diag_log format ["objLockAndClear.sqf - No further vehicle objectives found. %1 found total.", count _objVehicles];
      _allFound = true;
    };
  };
  _i = _i + 1;
};

//clear
{
  clearWeaponCargoGlobal _x;
  clearItemCargoGlobal _x;
  clearMagazineCargoGlobal _x;
  clearBackpackCargoGlobal _x;
  sleep 0.2;
} forEach _objVehicles;

//repeat this shit, because it's unreliable
while {count _objVehicles > 0} do {
  {
    if (locked _x == 1 || locked _x == 0) then {
      _x lock 2;
    } else {
      diag_log format ["objLockAndClear.sqf - Cleared and locked %1.", _x];
      _objVehicles = _objVehicles - [_x];
    };
    sleep 0.2;
  } forEach _objVehicles;
};
