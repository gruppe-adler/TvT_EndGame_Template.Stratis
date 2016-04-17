//SETTINGS =====================================================================
USECUSTOMLOADOUTS = true;     //use custom loadouts defined in the loadouts folder?

RESPAWNTIME = 30;             //delay before player may respawn
RESPAWNWAVEEXTRATIME = 20;    //time after a wave has respawned, that an additional player may respawn alone in

VEHICLERESPAWNTIME = 20;      //time after which vehicles respawn
VEHICLERESPAWNRADIUS = 50;  //distance between startposition and current position for a vehicle to start the respawn timer


//SERVER ONLY ==================================================================
if (isServer) then {

  _wshndl = [] execVM "helpers\wavesize.sqf";
  waitUntil {scriptDone _wshndl};

  OPFOR_ELIMINATED = false;
  BLUFOR_ELIMINATED = false;
  publicVariable "OPFOR_ELIMINATED";
  publicVariable "BLUFOR_ELIMINATED";

  mcd_fnc_addDeadPlayerToWave = compile preProcessFileLineNumbers "helpers\fn_addDeadPlayerToWave.sqf";
  mcd_fnc_removeRespawnedFromList = compile preprocessFileLineNumbers "helpers\fn_removeRespawnedFromList.sqf";

  if (isClass (configFile >> "CfgPatches" >> "task_force_radio")) then {
    [] execVM "tfarsettings.sqf";
  };

  [] execVM "server\handleRespawns.sqf";
  [] execVM "server\clearVehicles.sqf";
  [] execVM "server\respawnVehicles.sqf";
  [] execVM "server\objLockAndClear.sqf";
  [] execVM "server\transportHelis.sqf";
  [] execVM "server\detectAllDead.sqf";
};
