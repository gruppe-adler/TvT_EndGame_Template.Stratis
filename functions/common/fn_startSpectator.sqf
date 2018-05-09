/*  Starts spectator mode
*
*   executed via onPlayerKilled.sqf while player is waiting for respawn
*/

setPlayerRespawnTime 99999;

//show hint - respawn no longer possible
_rule = parseText "<t align='center'><t color='#708090'>-----------------------------------------------------<br /></t></t>";
_lineBreak = parseText "<br />";
_phase = parseText format ["<t align='center' size='1.4'>EndGame Phase ist aktiv!</t>"];
_respawnIn = parseText format ["<t align='center' size='1.4'>Respawn <t color='#cc0000'>nicht mehr verfügbar.</t></t>"];
hint composeText [_rule, _phase, _lineBreak, _respawnIn, _lineBreak, _rule];

//start spectator
[[west, east, civilian, independent], []] call ace_spectator_fnc_updateSides;
[playableUnits,[]] call ace_spectator_fnc_updateUnits;
[[0,1,2], []] call ace_spectator_fnc_updateCameraModes;
[true] call ace_spectator_fnc_setSpectator;

[{hint "";},[],10] call CBA_fnc_waitAndExecute;
