/*  Notifies server that player has respawned
*
*   executed locally on respawn
*/

//check JIP player is spawning for the first time
if (serverTime-joinTime < 30 && didJIP) exitWith {diag_log "Player is JIP, not executing onPlayerRespawn.sqf"};

//terminate spectator
[player, false] call TFAR_fnc_forceSpectator;
[false] call ace_spectator_fnc_setSpectator;

//notify server
[profileName, originalSide, player] remoteExec ["grad_endgame_common_fnc_handleRespawned",2,false];

//re-enable map
[false] call grad_endgame_common_fnc_blockMap;
