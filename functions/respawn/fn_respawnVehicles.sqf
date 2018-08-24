/*  Respawns vehicles
*
*   executed on server via init.sqf
*/
#include "../script_component.hpp"

diag_log "respawnVehicles.sqf starting...";

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
[{
    if (count respawnVehicles <= 0) then {
        diag_log "respawnVehicles.sqf - Currently no vehicles to check.";
    } else {
        {
            private _vehicle = (_x select 0);
            if (isNull _vehicle || !alive _vehicle || !canMove _vehicle) then {
                [_forEachIndex] call endgame_fnc_handleRespawnVehicle;
                diag_log format ["respawnVehicles.sqf - Vehicle destroyed/immobilized. Respawning type %2 in %1 seconds.", VEHICLERESPAWNTIME, respawnVehicleTypes select _forEachIndex];
            } else {
                if (getPos _vehicle distance2D (respawnVehicleStartPos select _forEachIndex) >= VEHICLERESPAWNRADIUS) then {
                    if ((isNil (str(respawnVehicleTypes select _forEachIndex))) || isNil (respawnVehicleTypes select _forEachIndex))) then {
                        respawnVehicleTypes set [_forEachIndex, (typeOf (respawnVehicles select _forEachIndex))];
                    };
                    [_forEachIndex] call endgame_fnc_handleRespawnVehicle;
                    diag_log format ["respawnVehicles.sqf - Vehicle more than %2m away from start point. Respawning type %3 in %1 seconds.",VEHICLERESPAWNTIME, VEHICLERESPAWNRADIUS, respawnVehicleTypes select _forEachIndex];
                };
            };
        }forEach respawnVehicles;
    };
},20,[]] call CBA_fnc_addPerFrameHandler;
