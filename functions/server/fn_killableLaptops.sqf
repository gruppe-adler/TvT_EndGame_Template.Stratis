/*  Makes laptops destructible
*
*   executed on server via init.sqf
*/

diag_log "killableLaptops.sqf starting...";

//replace them with EH enabled version
{
  _pos = getPos _x;
  _posASL = getPosASL _x;
  _dir = getDir _x;
  _var = vehicleVarName _x;

  deleteVehicle _x;

  _newLaptop = call compile (_var + " = 'Land_Laptop_unfolded_scripted_F' createVehicle _pos; " + _var);
  _newLaptop enableSimulationGlobal false;
  _newLaptop setPosASL _posASL;
  _newLaptop setDir _dir;
  _newLaptop setVehicleVarName _var;

  _newLaptops pushBack _newLaptop;
} forEach _laptops;

{
  [_x] spawn endgame_fnc_laptop;
} forEach ([] call endgame_fnc_findLaptops);
