
//SETTINGS =====================================================================
USECUSTOMLOADOUTS = true;   //use custom loadouts defined in the loadouts folder?
RESPAWNTIME = 30;           //delay before player may respawn
RESPAWNWAVEEXTRATIME = 20;  //time after a wave has respawned, that an additional player may respawn alone in



//SERVER AND PLAYER ============================================================
_waveSize = paramsArray select 0;
if (_waveSize == 0) then {
  _teamSize = (count ([] call BIS_fnc_listPlayers)) / 2;
  RESPAWNWAVESIZE = ceil (_teamSize / 3);
} else {
  RESPAWNWAVESIZE = _waveSize;
};
diag_log format ["Respawn wave size is %1", RESPAWNWAVESIZE];


//SERVER ONLY ==================================================================
if (isServer) then {

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
  [] execVM "server\objLockAndClear.sqf";
  [] execVM "server\transportHelis.sqf";
  [] execVM "server\detectAllDead.sqf";
};

//PLAYER ONLY ==================================================================
if (hasInterface) then {
  mcd_fnc_startSpectator = compile preProcessFileLineNumbers "player\fn_startSpectator.sqf";
  mcd_fnc_strReplaceSpaces = compile preprocessFileLineNumbers "helpers\fn_strReplaceSpaces.sqf";
  mcd_fnc_strReplaceUmlauts = compile preprocessFileLineNumbers "helpers\fn_strReplaceUmlauts.sqf";
  mcd_fnc_taskLocation = compile preprocessFileLineNumbers "player\fn_taskLocation.sqf";

  joinTime = serverTime;

  ["PRELOAD"] call mcd_fnc_taskLocation;
  [] execVM "helpers\originalSide.sqf";
  [] execVM "player\taskLocationEH.sqf";
  [] execVM "helpers\intro.sqf";
  [] execVM "player\endMission.sqf";
  if (USECUSTOMLOADOUTS) then {
    [] execVM "loadouts\loadoutInit.sqf";
  };
};
