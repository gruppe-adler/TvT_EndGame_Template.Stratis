params ["_i"];
_type = respawnVehicleTypes select _i;
_startPos = respawnVehicleStartPos select _i;
_isEmpty = (respawnVehicles select _i) select 1;
_respawnPos = _startPos findEmptyPosition [0,50,_type];

respawnVehicles deleteAt _i;
respawnVehicleTypes deleteAt _i;
respawnVehicleStartPos deleteAt _i;

[{
    params ["_type","_startPos","_respawnPos","_isEmpty"];
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
},[_type,_startPos,_respawnPos,_isEmpty],VEHICLERESPAWNTIME] call CBA_fnc_waitAndExecute;
