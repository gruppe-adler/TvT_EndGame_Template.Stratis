/*  Notifies server that player has respawned
*
*   executed locally on respawn
*/

//check JIP player is spawning for the first time
if (serverTime-joinTime < 30) exitWith {diag_log "Player is JIP, not executing onPlayerRespawn.sqf"};

//notify server
[str player, originalSide] remoteExec ["mcd_fnc_removeRespawnedFromList",2,false];
