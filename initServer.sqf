#include "USERSCRIPTS\missionSettings.sqf";

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
Endgame_Gamephase = 1;
WAVERESPAWNBLU = false;
WAVERESPAWNOPF = false;
WAVERESPAWNPLAYERSLEFTBLU = RESPAWNWAVESIZE;
WAVERESPAWNPLAYERSLEFTOPF = RESPAWNWAVESIZE;
WAVERESPAWNTIMELEFTBLU = WAVERESPAWNTIME;
WAVERESPAWNTIMELEFTOPF = WAVERESPAWNTIME;
FOBESTBLU = false;
FOBESTOPF = false;
FOBFREERESPAWNBLU = false;
FOBFREERESPAWNOPF = false;

publicVariable "SCHEMATICSVISIBLE";
publicVariable "Endgame_Gamephase";
publicVariable "SHOWCARRIERMARKER";
publicVariable "WAVERESPAWNBLU";
publicVariable "WAVERESPAWNOPF";
publicVariable "WAVERESPAWNPLAYERSLEFTBLU";
publicVariable "WAVERESPAWNPLAYERSLEFTOPF";
publicVariable "WAVERESPAWNTIMELEFTBLU";
publicVariable "WAVERESPAWNTIMELEFTOPF";
publicVariable "FOBESTBLU";
publicVariable "FOBESTOPF";
publicVariable "FOBFREERESPAWNBLU";
publicVariable "FOBFREERESPAWNOPF";

addMissionEventHandler ["HandleDisconnect", {[_this select 3] call endgame_fnc_handleRespawned}];

if (isClass (configFile >> "CfgPatches" >> "task_force_radio")) then {
  [] execVM "tfarsettings.sqf";
};

//setup scripts
[] call endgame_fnc_killableLaptops;
[] call endgame_fnc_removeFromCleanup;
[] call endgame_fnc_clearVehicles;
[] call endgame_fnc_objLockAndClear;
[] call endgame_fnc_transportHelis;
["SERVER"] call endgame_fnc_uploadTime;
["FINDOBJS"] spawn endgame_fnc_hideTaskMarkers;

//mission scripts
[] call endgame_fnc_handleRespawns;
[] call endgame_fnc_respawnVehicles;
[] call endgame_fnc_detectAllDead;
[] call endgame_fnc_endInDraw;
[] call endgame_fnc_uploadSoldiers;
[] spawn endgame_fnc_overwriteReveal;
[] call endgame_fnc_overwriteEnd;
[] call endgame_fnc_overwriteDraw;
[] call endgame_fnc_skipToEndgame;
