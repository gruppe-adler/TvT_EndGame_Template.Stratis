_waveSize = (["wavesize", 0] call BIS_fnc_getParamValue);
if (_waveSize == 0) then {
  RESPAWNWAVESIZE = ceil (((count ([] call BIS_fnc_listPlayers)) / 2) / 3);
} else {
  RESPAWNWAVESIZE = _waveSize;
};
publicVariable "RESPAWNWAVESIZE";
diag_log format ["Respawn wave size is %1", RESPAWNWAVESIZE];

SHOWCARRIERMARKER = (["carriermarker", 0] call BIS_fnc_getParamValue) == 1;

OPFOR_ELIMINATED = false;
BLUFOR_ELIMINATED = false;
ENDINDRAW = false;
SCHEMATICSVISIBLE = false;
GAMEPHASE = 1;

// civilian traffic
CIV_KILLED_POS = [0,0,0];
CIV_GUNFIGHT_POS = [0,0,0];

publicVariable "SCHEMATICSVISIBLE";
publicVariable "GAMEPHASE";
publicVariable "SHOWCARRIERMARKER";
publicVariable "CIV_KILLED_POS";
publicVariable "CIV_GUNFIGHT_POS";

addMissionEventHandler ["HandleDisconnect", {[_this select 3] call endgame_fnc_handleRespawned}];

if (isClass (configFile >> "CfgPatches" >> "task_force_radio")) then {
  [] execVM "tfarsettings.sqf";
};

//setup scripts
[] spawn endgame_fnc_killableLaptops;
[] spawn endgame_fnc_removeFromCleanup;
[] spawn endgame_fnc_clearVehicles;
[] spawn endgame_fnc_objLockAndClear;
[] spawn endgame_fnc_transportHelis;
[] spawn endgame_fnc_civKillListener;
[] spawn endgame_fnc_civGunfightListener;
["SERVER"] call endgame_fnc_uploadTime;
["FINDOBJS"] spawn endgame_fnc_hideTaskMarkers;

//mission scripts
[] spawn endgame_fnc_handleRespawns;
[] call endgame_fnc_respawnVehicles;
[] spawn endgame_fnc_detectAllDead;
[] call endgame_fnc_endInDraw;
[] spawn endgame_fnc_uploadSoldiers;
[] spawn endgame_fnc_overwriteReveal;
[] call endgame_fnc_overwriteEnd;
[] call endgame_fnc_overwriteDraw;
[] call endgame_fnc_skipToEndgame;
