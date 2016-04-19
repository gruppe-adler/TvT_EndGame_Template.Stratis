/*  Clears all vehicles that are named in the format emptyVehicle_n
*
*   executed on server via init.sqf
*/


diag_log "clearVehicles.sqf starting...";

_objVehicles = [];

//find vehicles
_allFound = false;
_i = 1;
_counter = 0;
_notFoundCount = 0;
while {!_allFound} do {
  _vehicleVar = "emptyVehicle_" + (str _i);
  if (!isNil _vehicleVar) then {
    _notFoundCount = 0;
    _vehicleVar = call compile _vehicleVar;
    _objVehicles pushBack _vehicleVar;
    _counter = _counter + 1;
  } else {
    _notFoundCount = _notFoundCount + 1;
    if (_notFoundCount >= 10) then {
      diag_log format ["clearVehicles.sqf - No further vehicles found. %1 found total.", _counter];
      _allFound = true;
    };
  };

  _i = _i + 1;
};

//find respawn vehicles
_allFound = false;
_i = 1;
_counter = 0;
_notFoundCount = 0;
while {!_allFound} do {
  _vehicleVar = "emptyRespawnVehicle_" + (str _i);
  if (!isNil _vehicleVar) then {
    _notFoundCount = 0;
    _vehicleVar = call compile _vehicleVar;
    _objVehicles pushBack _vehicleVar;
    _counter = _counter + 1;
  } else {
    _notFoundCount = _notFoundCount + 1;
    if (_notFoundCount >= 10) then {
      diag_log format ["clearVehicles.sqf - No further respawnvehicles found. %1 found total.", _counter];
      _allFound = true;
    };
  };

  _i = _i + 1;
};

//find slingloadobjects
_allFound = false;
_i = 1;
_counter = 0;
_notFoundCount = 0;
while {!_allFound} do {
  _vehicleVar = "emptySlingloadObject_" + (str _i);
  if (!isNil _vehicleVar) then {
    _notFoundCount = 0;
    _vehicleVar = call compile _vehicleVar;
    _objVehicles pushBack _vehicleVar;
    _counter = _counter + 1;
  } else {
    _notFoundCount = _notFoundCount + 1;
    if (_notFoundCount >= 10) then {
      diag_log format ["clearVehicles.sqf - No further slingloadobjects found. %1 found total.", _counter];
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
