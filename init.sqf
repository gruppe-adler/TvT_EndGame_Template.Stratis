#include "USERSCRIPTS\missionsettings.sqf";

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

  mcd_fnc_addDeadPlayerToWave = compile preProcessFileLineNumbers "helpers\fn_addDeadPlayerToWave.sqf";
  mcd_fnc_removeRespawnedFromList = compile preprocessFileLineNumbers "helpers\fn_removeRespawnedFromList.sqf";

  addMissionEventHandler ["HandleDisconnect", {[_this select 3] spawn mcd_fnc_removeRespawnedFromList}];

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

  //mission scripts
  [] execVM "server\respawnVehicles.sqf";
  [] execVM "server\handleRespawns.sqf";
  [] execVM "server\detectAllDead.sqf";
  [] execVM "server\endInDraw.sqf";

};
