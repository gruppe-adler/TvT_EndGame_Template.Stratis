/*  Removes a player from the wave respawn queue array
*
*   executed via remoteExec by client's onPlayerKilled.sqf
*/

params ["_respawnedPlayer","_respawnedSide"];

diag_log format ["Player has respawned: %1", _respawnedPlayer];

if (_respawnedSide == "WEST") then {
  deadPlayersBlu = deadPlayersBlu - [_respawnedPlayer];
} else {
  if (_respawnedSide == "EAST") then {
    deadPlayersOpf = deadPlayersOpf - [_respawnedPlayer];
  } else {
    diag_log format ["removeRespawnedFromList - ERROR, unknown side: %1", _this select 0];
  };
};

//in case some dead players are already null objects
deadPlayersBlu = deadPlayersBlu - [objNull];
deadPlayersOpf = deadPlayersOpf - [objNull];

//wait extra respawn time
sleep RESPAWNWAVEEXTRATIME;

WAVERESPAWNPLAYERSLEFTBLU = RESPAWNWAVESIZE - (count deadPlayersBlu);
WAVERESPAWNPLAYERSLEFTOPF = RESPAWNWAVESIZE - (count deadPlayersOpf);
publicVariable "WAVERESPAWNPLAYERSLEFTBLU";
publicVariable "WAVERESPAWNPLAYERSLEFTOPF";
