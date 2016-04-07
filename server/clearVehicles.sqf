/*  Clears all vehicles that are named in the format emptyVehicle_n
*
*   executed on server via init.sqf
*/


diag_log "clearVehicles.sqf starting...";

_objVehicles = [];
_allFound = false;
_i = 1;

//find
while {!_allFound} do {
  _vehicleVar = "emptyVehicle_" + (str _i);
  if (!isNil _vehicleVar) then {
    _vehicleVar = call compile _vehicleVar;
    if (_vehicleVar isKindOf "landVehicle" || _vehicleVar isKindOf "Air" || _vehicleVar isKindOf "Boat") then {
      _objVehicles pushBack _vehicleVar;
    } else {
      diag_log format ["clearVehicles.sqf - Object %1 is not a vehicle.", _vehicleVar];
    };
  } else {
    diag_log format ["clearVehicles.sqf - No further vehicles found. %1 found total.", count _objVehicles];
    _allFound = true;
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
