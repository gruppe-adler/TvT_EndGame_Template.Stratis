/*  Starts spectator mode
*
*   executed via onPlayerKilled.sqf while player is waiting for respawn
*/

setPlayerRespawnTime = 9999;

//show hint - respawn no longer possible
_rule = parseText "<t align='center'><t color='#708090'>----------------------------------------------<br /></t></t>";
_lineBreak = parseText "<br />";
_phase = parseText format ["<t align='center'>EndGame Phase hat begonnen!</t>"]
_respawnIn = parseText format ["<t align='center'>Respawn <t color='#cc0000'>nicht mehr verfügbar.</t></t>"];
hint composeText [_rule, _phase, _lineBreak, _respawnIn, _lineBreak, _rule];

//spectator settings
RscSpectator_allowFreeCam = true;
RscSpectator_hints = [true,true,true];

//register layer
_spectatorLayer = ["specator_layer"] call BIS_fnc_rscLayer;

//disable post-processing
BIS_fnc_feedback_allowPP = false;

//start spectator
_spectatorLayer cutRsc ["RscSpectator", "PLAIN"];
