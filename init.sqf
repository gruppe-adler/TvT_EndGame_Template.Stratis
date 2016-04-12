
//SETTINGS =====================================================================
USECUSTOMLOADOUTS = true;   //use custom loadouts defined in the loadouts folder?
RESPAWNTIME = 30;           //delay before player may respawn
RESPAWNWAVEEXTRATIME = 15;  //time after a wave has respawned, that an additional player may respawn alone in
RESPAWNWAVESIZE = 1;        //number of other dead players per side before respawn is possible


//SERVER ONLY ==================================================================
if (isServer) then {
  mcd_fnc_addDeadPlayerToWave = compile preProcessFileLineNumbers "helpers\fn_addDeadPlayerToWave.sqf";
  mcd_fnc_removeRespawnedFromList = compile preprocessFileLineNumbers "helpers\fn_removeRespawnedFromList.sqf";

  if (isClass (configFile >> "CfgPatches" >> "task_force_radio")) then {
    [] execVM "helpers\tfarsettings.sqf";
  };
  [] execVM "server\handleRespawns.sqf";
  [] execVM "server\clearVehicles.sqf";
  [] execVM "server\objLockAndClear.sqf";
};

//PLAYER ONLY ==================================================================
if (hasInterface) then {
  mcd_fnc_startSpectator = compile preProcessFileLineNumbers "player\fn_startSpectator.sqf";
  mcd_fnc_strReplaceSpaces = compile preprocessFileLineNumbers "helpers\fn_strReplaceSpaces.sqf";
  mcd_fnc_taskLocation = compile preprocessFileLineNumbers "player\fn_taskLocation.sqf";

  joinTime = serverTime;

  ["PRELOAD"] call mcd_fnc_taskLocation;
  [] execVM "helpers\originalSide.sqf";
  [] execVM "player\taskLocationEH.sqf";
  if (USECUSTOMLOADOUTS) then {
    [] execVM "loadouts\loadoutInit.sqf";
  };
};
