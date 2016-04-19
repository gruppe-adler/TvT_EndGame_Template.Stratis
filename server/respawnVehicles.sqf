/*  Respawns vehicles
*
*   executed on server via init.sqf
*/

diag_log "respawnVehicles.sqf starting...";
sleep 5;

//RESPAWN FUNCTION =============================================================
mcd_fnc_respawnVehicle = {
  params ["_i"];
  _type = respawnVehicleTypes select _i;
  _startPos = respawnVehicleStartPos select _i;
  _isEmpty = (respawnVehicles select _i) select 1;
  _respawnPos = _startPos findEmptyPosition [0,50,_type];

  respawnVehicles deleteAt _i;
  respawnVehicleTypes deleteAt _i;
  respawnVehicleStartPos deleteAt _i;

  sleep VEHICLERESPAWNTIME;

  if (str _respawnPos == "[]") exitWith {diag_log format ["respawnVehicles.sqf - Could not find position for %1", _type]};

  _vehicle = _type createVehicle _respawnPos;
  diag_log format ["respawnVehicles.sqf - %1 spawned.", _type];

  respawnVehicles pushBack [_vehicle, _isEmpty];
  respawnVehicleTypes pushBack _type;
  respawnVehicleStartPos pushBack _startPos;

  if (_isEmpty == "true") then {
    clearWeaponCargoGlobal _vehicle;
    clearItemCargoGlobal _vehicle;
    clearMagazineCargoGlobal _vehicle;
    clearBackpackCargoGlobal _vehicle;
    diag_log "respawnVehicles.sqf - Vehicle cleared.";
  };
};

//GET VEHICLES =================================================================
respawnVehicles = [];
respawnVehicleTypes = [];
respawnVehicleStartPos = [];
_allFound = false;
_i = 1;

//find respawn vehicles
while {!_allFound} do {

  _vehicleVar = "respawnvehicle_" + (str _i);
  if (!isNil _vehicleVar) then {
    _vehicleVar = call compile _vehicleVar;
    respawnVehicles pushBack [_vehicleVar, "false"];

  } else {
    _vehicleVar = "emptyrespawnvehicle_" + (str _i);
    if (!isNil _vehicleVar) then {
      _vehicleVar = call compile _vehicleVar;
      respawnVehicles pushBack [_vehicleVar, "true"];

    } else {
      _allFound = true;
      diag_log format ["respawnVehicles.sqf - No further vehicles found. %1 found total.", count respawnVehicles];
    };
  };

  _i = _i + 1;
};

//exit if no vehicles found
if (count respawnVehicles <= 0) exitWith {diag_log "respawnVehicles.sqf - No respawn vehicles. Exiting."};

//get classnames and startpositions
{
  respawnVehicleTypes pushBack (typeOf (_x select 0));
  respawnVehicleStartPos pushBack (getPos (_x select 0));
} forEach respawnVehicles;


//MAIN =========================================================================
while {true} do {
  _i = 0;

  if (count respawnVehicles <= 0) then {
    diag_log "respawnVehicles.sqf - Currently no vehicles to check.";

  } else {
    {
      if (isNull (_x select 0) || !alive (_x select 0) || !canMove (_x select 0)) then {
        [_i] spawn mcd_fnc_respawnVehicle;
        diag_log format ["respawnVehicles.sqf - Vehicle destroyed/immobilized. Respawning type %2 in %1 seconds.", VEHICLERESPAWNTIME, respawnVehicleTypes select _i];
      } else {
        if (getPos (_x select 0) distance2D (respawnVehicleStartPos select _i) >= VEHICLERESPAWNRADIUS) then {
          [_i] spawn mcd_fnc_respawnVehicle;
          diag_log format ["respawnVehicles.sqf - Vehicle more than %2m away from start point. Respawning type %3 in %1 seconds.",VEHICLERESPAWNTIME, VEHICLERESPAWNRADIUS, respawnVehicleTypes select _i];
        };
      };

      sleep 1;
      _i = _i + 1;
    } forEach respawnVehicles;
  };

  sleep 20;
};
