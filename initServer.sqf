#include "../script_component.hpp"
#include "USERSCRIPTS\missionSettings.sqf";

_waveSize = (["wavesize", 0] call BIS_fnc_getParamValue);
if (_waveSize == 0) then {
  GVARMAIN(RESPAWNWAVESIZE) = ceil (((count ([] call BIS_fnc_listPlayers)) / 2) / 3);
} else {
  GVARMAIN(RESPAWNWAVESIZE) = _waveSize;
};
publicVariable QGVARMAIN(RESPAWNWAVESIZE);
diag_log format ["Respawn wave size is %1", GVARMAIN(RESPAWNWAVESIZE)];

//Create Global Vars
GVARMAIN(SCHEMATICSVISIBLE) = (["carriermarker", 0] call BIS_fnc_getParamValue) == 1;

GVARMAIN(OPFOR_ELIMINATED) = false;
GVARMAIN(BLUFOR_ELIMINATED) = false;
GVARMAIN(ENDINDRAW) = false;
GVARMAIN(SCHEMATICSVISIBLE) = false;
GVARMAIN(GAMEPHASE) = 1;
GVARMAIN(WAVERESPAWNBLU) = false;
GVARMAIN(WAVERESPAWNOPF) = false;
GVARMAIN(WAVERESPAWNPLAYERSLEFTBLU) = GVARMAIN(RESPAWNWAVESIZE);
GVARMAIN(WAVERESPAWNPLAYERSLEFTOPF) = GVARMAIN(RESPAWNWAVESIZE);
GVARMAIN(GVARMAIN(WAVERESPAWNTIME)LEFTBLU) = GVARMAIN(WAVERESPAWNTIME);
GVARMAIN(GVARMAIN(WAVERESPAWNTIME)LEFTOPF) = GVARMAIN(WAVERESPAWNTIME);
GVARMAIN(FOBESTBLU) = false;
GVARMAIN(FOBESTOPF) = false;
GVARMAIN(FOBFREERESPAWNBLU) = false;
GVARMAIN(FOBFREERESPAWNOPF) = false;

publicVariable QGVARMAIN(SCHEMATICSVISIBLE);
publicVariable QGVARMAIN(GAMEPHASE);
publicVariable QGVARMAIN(SCHEMATICSVISIBLE);
publicVariable QGVARMAIN(WAVERESPAWNBLU);
publicVariable QGVARMAIN(WAVERESPAWNOPF);
publicVariable QGVARMAIN(WAVERESPAWNPLAYERSLEFTBLU);
publicVariable QGVARMAIN(WAVERESPAWNPLAYERSLEFTOPF);
publicVariable QGVARMAIN(GVARMAIN(WAVERESPAWNTIME)LEFTBLU);
publicVariable QGVARMAIN(GVARMAIN(WAVERESPAWNTIME)LEFTOPF);
publicVariable QGVARMAIN(FOBESTBLU);
publicVariable QGVARMAIN(FOBESTOPF);
publicVariable QGVARMAIN(FOBFREERESPAWNBLU);
publicVariable QGVARMAIN(FOBFREERESPAWNOPF);

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
[] call endgame_fnc_GVARMAIN(ENDINDRAW);
[] call endgame_fnc_uploadSoldiers;
[] spawn endgame_fnc_overwriteReveal;
[] call endgame_fnc_overwriteEnd;
[] call endgame_fnc_overwriteDraw;
[] call endgame_fnc_skipToEndgame;
