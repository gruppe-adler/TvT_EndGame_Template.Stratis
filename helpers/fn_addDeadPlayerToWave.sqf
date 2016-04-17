/*  Adds a player to the wave respawn queue array
*
*   executed via remoteExec by client's onPlayerKilled.sqf
*/

params ["_deadPlayer", "_deadPlayerSide"];

//wait until handleRespawns.sqf has declared dead player arrays
waitUntil {!isNil "deadPlayersBlu"};
waitUntil {!isNil "deadPlayersOpf"};

//add player to array
if (_deadPlayerSide == "WEST") then {
  deadPlayersBlu pushBack _deadPlayer;
  diag_log format ["addDeadPlayerToWave - added player %1 to deadPlayersBlu. %2 dead blufor total.", _deadPlayer, count deadPlayersBlu];
} else {
  if (_deadPlayerSide == "EAST") then {
    deadPlayersOpf pushBack _deadPlayer;
    diag_log format ["addDeadPlayerToWave - added player %1 to deadPlayersOpf. %2 dead opfor total.", _deadPlayer, count deadPlayersOpf];
  } else {
    diag_log format ["addDeadPlayerToWave - ERROR, unknown side for player %1", _deadPlayer];
  };
};

WAVERESPAWNPLAYERSLEFTBLU = RESPAWNWAVESIZE - (count deadPlayersBlu);
WAVERESPAWNPLAYERSLEFTOPF = RESPAWNWAVESIZE - (count deadPlayersOpf);
publicVariable "WAVERESPAWNPLAYERSLEFTBLU";
publicVariable "WAVERESPAWNPLAYERSLEFTOPF";
