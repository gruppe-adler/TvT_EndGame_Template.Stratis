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

  mcd_fnc_addDeadPlayerToWave = compile preProcessFileLineNumbers "functions\fn_addDeadPlayerToWave.sqf";
  mcd_fnc_handleRespawned = compile preprocessFileLineNumbers "functions\fn_handleRespawned.sqf";
  mcd_fnc_addRespawnedToGroup = compile preprocessFileLineNumbers "functions\fn_addRespawnedToGroup.sqf";
  mcd_fnc_hideTaskMarkers = compile preprocessFileLineNumbers "functions\fn_hideTaskMarkers.sqf";
  mcd_fnc_getBuildingPositions = compile preprocessFileLineNumbers "functions\fn_getBuildingPositions.sqf";

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
  ["SERVER"] execVM "helpers\uploadTime.sqf";
  ["FINDOBJS"] spawn mcd_fnc_hideTaskMarkers;

  //mission scripts
  [] execVM "server\respawnVehicles.sqf";
  [] execVM "server\handleRespawns.sqf";
  [] execVM "server\detectAllDead.sqf";
  [] execVM "server\endInDraw.sqf";
  [] execVM "server\uploadSoldiers.sqf";
  [] execVM "server\overwriteReveal.sqf";

};
