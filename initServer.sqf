[] call grad_endgame_helpers_fnc_wavesize;

SHOWCARRIERMARKER = (["carriermarker", 0] call BIS_fnc_getParamValue) == 1;
publicVariable "SHOWCARRIERMARKER";

OPFOR_ELIMINATED = false;
BLUFOR_ELIMINATED = false;
ENDINDRAW = false;
publicVariable "OPFOR_ELIMINATED";
publicVariable "BLUFOR_ELIMINATED";
publicVariable "ENDINDRAW";

// civilian traffic
CIV_KILLED_POS = [0,0,0];
publicVariable "CIV_KILLED_POS";
CIV_GUNFIGHT_POS = [0,0,0];
publicVariable "CIV_GUNFIGHT_POS";

addMissionEventHandler ["HandleDisconnect", {[_this select 3] call grad_endgame_common_fnc_handleRespawned}];

if (isClass (configFile >> "CfgPatches" >> "task_force_radio")) then {
  [] execVM "tfarsettings.sqf";
};

//setup scripts
[] call grad_endgame_server_fnc_killableLaptops;
[] call grad_endgame_server_fnc_removeFromCleanup;
[] call grad_endgame_server_fnc_clearVehicles;
[] call grad_endgame_server_fnc_objLockAndClear;
[] call grad_endgame_server_fnc_transportHelis;
[] call grad_endgame_common_fnc_fillContainerInit;
[] call grad_endgame_server_fnc_civKillListener;
[] call grad_endgame_server_fnc_civGunfightListener;
["SERVER"] call grad_endgame_server_fnc_uploadTime;
["FINDOBJS"] spawn grad_endgame_common_fnc_hideTaskMarkers;

//mission scripts
[] call grad_endgame_server_fnc_respawnVehicles;
[] call grad_endgame_server_fnc_handleRespawns;
[] call grad_endgame_server_fnc_detectAllDead;
[] call grad_endgame_server_fnc_endInDraw;
[] call grad_endgame_server_fnc_uploadSoldiers;
[] call grad_endgame_server_fnc_overwriteReveal;
[] call grad_endgame_server_fnc_skipToEndgame;
