/*  Adds a respawned player to a new group
*
*   Params:
*   0:  respawned player (object)
*   1:  originalSide (string)
*
*   executed by fnc_handleRespawned
*/

params ["_player", "_side"];
private ["_leader"];

if (_side == "UNKNOWN") exitWith {diag_log format ["fnc_addREspawnedToGroup - Player %1's side is unknown.", _player]};


if (_side == "WEST") then {
  newBluSpawns pushBack _player;
  _leader = newBluSpawns select 0;
};

if (_side == "EAST") then {
  newOpfSpawns pushBack _player;
  _leader = newOpfSpawns select 0;
};


if (_player != _leader) then {
  [_player] joinSilent _leader;
  diag_log format ["fnc_addRespawnedToGroup - Player %1 joined %2's group.", _player, _leader];
} else {
  diag_log format ["fnc_addRespawnedToGroup - Player %1 is groupleader of new respawned players for side %2.", _player, _side];
};
