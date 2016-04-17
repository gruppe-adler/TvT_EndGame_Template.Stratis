/*  Removes a player from the wave respawn queue array
*
*   executed via remoteExec by client's onPlayerRespawn.sqf
*/

params ["_respawnedPlayer","_respawnedSide"];

diag_log format ["Player has respawned: %1", _respawnedPlayer];

if (_respawnedPlayer in deadPlayersBlu || _respawnedPlayer in deadPlayersOpf) then {
  if (_respawnedSide == "WEST") then {
    deadPlayersBlu = deadPlayersBlu - [_respawnedPlayer];
  } else {
    if (_respawnedSide == "EAST") then {
      deadPlayersOpf = deadPlayersOpf - [_respawnedPlayer];
    } else {
      diag_log format ["removeRespawnedFromList - ERROR, unknown side: %1", _this select 0];
    };
  };

} else {
  //in case some dead players are already null objects
  _i = 0;
  {
    if (_x == "<NULL-object>") exitWith {deadPlayersBlu deleteAt _i};
    _i = _i + 1;
  } forEach deadPlayersBlu;
  _i = 0;
  {
    if (_x == "<NULL-object>") exitWith {deadPlayersOpf deleteAt _i};
    _i = _i + 1;
  } forEach deadPlayersOpf;
};

//wait extra respawn time
sleep RESPAWNWAVEEXTRATIME;

WAVERESPAWNPLAYERSLEFTBLU = RESPAWNWAVESIZE - (count deadPlayersBlu);
WAVERESPAWNPLAYERSLEFTOPF = RESPAWNWAVESIZE - (count deadPlayersOpf);
publicVariable "WAVERESPAWNPLAYERSLEFTBLU";
publicVariable "WAVERESPAWNPLAYERSLEFTOPF";
