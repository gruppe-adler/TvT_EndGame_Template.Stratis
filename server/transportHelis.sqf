/*  Sets behaviour and slingload cargo of transport helicopters
*
*   executed on server via init.sqf
*/

diag_log "transportHelis.sqf starting...";

_fnc_setBehaviour = {
  _vehicle = _this select 0;
  _vehgroup = group _vehicle;
  _vehicle setCaptive true;
  _vehicle setCombatMode "Blue";
  _vehicle allowFleeing 0;
  _vehgroup setBehaviour "Careless";
  {_x disableAI "target";
  _x disableAI "autotarget"} forEach (units group _vehicle);
  (driver _vehicle) setSkill ["Courage",1];
  (driver _vehicle) setSkill ["General",1];
};


//find helis
_vehicleCount = 0;
_allFound = false;
_i = 1;
_notFoundCount = 0;
while {!_allFound} do {
  _vehicleVar = "transportheli_" + (str _i);

  if (!isNil _vehicleVar) then {
    _notFoundCount = 0;
    _vehicleVar = call compile _vehicleVar;
    [_vehicleVar] spawn _fnc_setBehaviour;

    _slingloadVar = "slingloadobject_" + (str _i);
    if (!isNil _slingloadVar) then {
      _slingloadVar = call compile _slingloadVar;
      _vehicleVar setSlingLoad _slingloadVar;
    };

    _slingloadVar = "emptyslingloadobject_" + (str _i);
    if (!isNil _slingloadVar) then {
      _slingloadVar = call compile _slingloadVar;
      _vehicleVar setSlingLoad _slingloadVar;
    };

    _slingloadVar = "fillslingloadobject_" + (str _i);
    if (!isNil _slingloadVar) then {
      _slingloadVar = call compile _slingloadVar;
      _vehicleVar setSlingLoad _slingloadVar;
    };

    _vehicleCount = _vehicleCount + 1;
  } else {
    _notFoundCount = _notFoundCount + 1;
    if (_notFoundCount >= 10) then {
      diag_log format ["transporthelis.sqf - No further transport helicopters found. %1 found total.", _vehicleCount];
      _allFound = true;
    };
  };

  _i = _i + 1;
};
