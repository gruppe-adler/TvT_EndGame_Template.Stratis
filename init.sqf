#include "USERSCRIPTS\missionsettings.sqf";

//ENGIMA TRAFFIC ===============================================================
CIVILIAN_TRAFFIC = paramsArray select 2;
if (CIVILIAN_TRAFFIC == 1) then {
  [] execVM "Engima\Traffic\Init.sqf";
};

//SERVER ONLY ==================================================================
if (isServer) then {

  _wshndl = [] execVM "helpers\wavesize.sqf";
  waitUntil {scriptDone _wshndl};

  SHOWCARRIERMARKER = (paramsArray select 1) == 1;
  publicVariable "SHOWCARRIERMARKER";

  MAXRESPAWNTIME = 1200;
  OPFOR_ELIMINATED = false;
  BLUFOR_ELIMINATED = false;
  ENDINDRAW = false;
  publicVariable "MAXRESPAWNTIME";
  publicVariable "OPFOR_ELIMINATED";
  publicVariable "BLUFOR_ELIMINATED";
  publicVariable "ENDINDRAW";

  // civilian traffic
  CIV_KILLED_POS = [0,0,0];
  publicVariable "CIV_KILLED_POS";
  CIV_GUNFIGHT_POS = [0,0,0];
  publicVariable "CIV_GUNFIGHT_POS";

  mcd_fnc_addDeadPlayerToWave = compile preProcessFileLineNumbers "helpers\fn_addDeadPlayerToWave.sqf";
  mcd_fnc_handleRespawned = compile preprocessFileLineNumbers "helpers\fn_handleRespawned.sqf";
  mcd_fnc_addRespawnedToGroup = compile preprocessFileLineNumbers "helpers\fn_addRespawnedToGroup.sqf";

  addMissionEventHandler ["HandleDisconnect", {[_this select 3] spawn mcd_fnc_handleRespawned}];

  if (isClass (configFile >> "CfgPatches" >> "task_force_radio")) then {
    [] execVM "server\tfarsettings.sqf";
  };

  //setup scripts
  [] execVM "server\killableLaptops.sqf";
  [] execVM "server\removeFromCleanup.sqf";
  [] execVM "server\clearVehicles.sqf";
  [] execVM "server\objLockAndClear.sqf";
  [] execVM "server\transportHelis.sqf";
  [] execVM "fillContainerInit.sqf";
  [] execVM "server\civKillListener.sqf";
  [] execVM "server\civGunfightListener.sqf";

  //mission scripts
  [] execVM "server\respawnVehicles.sqf";
  [] execVM "server\handleRespawns.sqf";
  [] execVM "server\detectAllDead.sqf";
  [] execVM "server\endInDraw.sqf";

};
