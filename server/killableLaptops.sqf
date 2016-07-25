/*  Makes laptops destructible
*
*   executed on server via init.sqf
*/

diag_log "killableLaptops.sqf starting...";

mcd_fnc_makeDestructible = compile preprocessFileLineNumbers "functions\fn_laptop.sqf";

_laptops = [];
_newLaptops = [];
_allFound = false;
_i = 1;
_notFoundCount = 0;

//find laptops
while {!_allFound} do {
  _vehicleVar = "obj_download_" + (str _i);
  if (!isNil _vehicleVar) then {
    _notFoundCount = 0;
    _vehicleVar = call compile _vehicleVar;
    _type = typeOf _vehicleVar;
    if (_type == "Land_Laptop_unfolded_F" || _type == "Land_Laptop_device_F" || _type == "Land_Laptop_F") then {
      _laptops pushBack _vehicleVar;
    };
  } else {
    _notFoundCount = _notFoundCount + 1;
    if (_notFoundCount >= 20) then {
      diag_log format ["killableLaptops.sqf - No further laptops found. %1 found total.", count _laptops];
      _allFound = true;
    };
  };
  _i = _i + 1;
};

//replace them with EH enabled version
{
  _pos = getPos _x;
  _posASL = getPosASL _x;
  _dir = getDir _x;
  _var = vehicleVarName _x;

  deleteVehicle _x;

  _newLaptop = call compile (_var + " = 'Land_Laptop_unfolded_scripted_F' createVehicle _pos; " + _var);
  /*_newLaptop = "Land_Laptop_unfolded_scripted_F" createVehicle _pos;*/
  _newLaptop enableSimulationGlobal false;
  _newLaptop setPosASL _posASL;
  _newLaptop setDir _dir;
  _newLaptop setVehicleVarName _var;

  _newLaptops pushBack _newLaptop;
} forEach _laptops;

{
  [_x] spawn mcd_fnc_makeDestructible;
  sleep 0.5;
} forEach _newLaptops;
