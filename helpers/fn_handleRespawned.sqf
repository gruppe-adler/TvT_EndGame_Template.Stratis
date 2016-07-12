/*  Removes a player from the wave respawn queue array
*
*   executed via remoteExec by client's onPlayerRespawn.sqf
*/

_respawnedPlayer = param [0,""];
_respawnedSide = param [1,"UNKNOWN"];
_respawnedUnit = param [2, objNull];

[_respawnedUnit, _respawnedSide] spawn mcd_fnc_addRespawnedToGroup;

switch (_respawnedSide) do {

  case "WEST": {
    if (_respawnedPlayer in deadPlayersBlu) then {
      deadPlayersBlu = deadPlayersBlu - [_respawnedPlayer];
      diag_log format ["fnc_handleRespawned - Player %1 respawned and has been removed from deadPlayersBlu.", _respawnedPlayer];
    } else {
      diag_log format ["fnc_handleRespawned - ERROR, player %1 is not in deadPlayersBlu", _respawnedPlayer];
    };
  };

  case "EAST": {
    if (_respawnedPlayer in deadPlayersOpf) then {
      deadPlayersOpf = deadPlayersOpf - [_respawnedPlayer];
      diag_log format ["fnc_handleRespawned - Player %1 respawned and has been removed from deadPlayersOpf.", _respawnedPlayer];
    } else {
      diag_log format ["fnc_handleRespawned - ERROR, player %1 is not in deadPlayersOpf", _respawnedPlayer];
    };
  };

  case "UNKNOWN": {
    if (_respawnedPlayer in deadPlayersBlu) then {
      deadPlayersBlu = deadPlayersBlu - [_respawnedPlayer];
      [_respawnedPlayer, "WEST"] call mcd_fnc_addRespawnedToGroup;
      diag_log format ["fnc_handleRespawned - Player %1 disconnected and has been removed from deadPlayersBlu", _respawnedPlayer];
    } else {
      if (_respawnedPlayer in deadPlayersOpf) then {
        deadPlayersOpf = deadPlayersOpf - [_respawnedPlayer];
        [_respawnedPlayer, "EAST"] call mcd_fnc_addRespawnedToGroup;
        diag_log format ["fnc_handleRespawned - Player %1 disconnected and has been removed from deadPlayersOpf", _respawnedPlayer];
      } else {
        diag_log format ["fnc_handleRespawned - Player %1 disconnected but was not waiting for respawn", _respawnedPlayer];
      };
    };
  };

  default {diag_log format ["fnc_handleRespawned - ERROR, player %1 is neither WEST nor EAST nor UNKNOWN", _respawnedPlayer]};
};


//wait extra respawn time
sleep RESPAWNWAVEEXTRATIME;

WAVERESPAWNPLAYERSLEFTBLU = RESPAWNWAVESIZE - (count deadPlayersBlu);
WAVERESPAWNPLAYERSLEFTOPF = RESPAWNWAVESIZE - (count deadPlayersOpf);
publicVariable "WAVERESPAWNPLAYERSLEFTBLU";
publicVariable "WAVERESPAWNPLAYERSLEFTOPF";
