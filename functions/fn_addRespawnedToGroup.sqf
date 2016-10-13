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

if (_side == "UNKNOWN") exitWith {diag_log format ["fnc_addRespawnedToGroup - Player %1's side is unknown.", _player]};


if (_side == "WEST") then {
  newBluSpawns pushBack _player;
  _leader = newBluSpawns select 0;
};

if (_side == "EAST") then {
  newOpfSpawns pushBack _player;
  _leader = newOpfSpawns select 0;
};

//player is not leader --> join leader
if (_player != _leader) then {
  [_player] joinSilent _leader;
  diag_log format ["fnc_addRespawnedToGroup - Player %1 joined %2's group.", _player, _leader];
};

//player is leader --> register group
if (_player == _leader) then {
  [_player] joinSilent grpNull;
  _groupExists = true;
  _groupName = "";
  _i = 1;
  while {_groupExists} do {
    _groupName = format ["Reinforcements %1", _i];
    _groupExists = str (["GetGroupByName", [_groupName, side _leader]] call BIS_fnc_dynamicGroups) != "<NULL-group>";
    _i = _i + 1;
  };
 ["RegisterGroup", [group _leader, _leader, [nil, _groupName, false]]] call BIS_fnc_dynamicGroups;
  diag_log format ["fnc_addRespawnedToGroup - Player %1 is groupleader of new respawned players for side %2.", _player, _side];
};
