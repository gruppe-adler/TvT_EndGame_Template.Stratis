RESPAWNTIME = 30;           //delay before player may respawn
RESPAWNWAVEEXTRATIME = 15;  //time after a wave has respawned, that an additional player may respawn alone in
RESPAWNWAVESIZE = 2;        //number of other dead players per side before respawn is possible


//SERVER ONLY ==================================================================
if (isServer) then {
  mcd_fnc_addDeadPlayerToWave = compile preProcessFileLineNumbers "helpers\fn_addDeadPlayerToWave.sqf";
  mcd_fnc_removeRespawnedFromList = compile preprocessFileLineNumbers "helpers\fn_removeRespawnedFromList.sqf";

  [] execVM "server\handleRespawns.sqf";

};

//PLAYER ONLY ==================================================================
if (hasInterface) then {
  mcd_fnc_startSpectator = compile preProcessFileLineNumbers "player\fn_startSpectator.sqf";
  
  joinTime = serverTime;

  [] execVM "helpers\originalSide.sqf";
};
