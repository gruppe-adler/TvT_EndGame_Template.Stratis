#include "USERSCRIPTS\missionsettings.sqf";

//LOADOUTS =====================================================================
["BLU_F", LOADOUTFACTIONBLU] call GRAD_Loadout_fnc_FactionSetLoadout;
["OPF_F", LOADOUTFACTIONOPF] call GRAD_Loadout_fnc_FactionSetLoadout;

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
  [] execVM "server\skipToEndgame.sqf";

};
