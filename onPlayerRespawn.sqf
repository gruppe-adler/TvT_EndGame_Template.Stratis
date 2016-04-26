/*  Notifies server that player has respawned
*
*   executed locally on respawn
*/

if (USECUSTOMLOADOUTS) then {
  [] execVM "loadoutInit.sqf";
};

//check JIP player is spawning for the first time
if (serverTime-joinTime < 30 && didJIP) exitWith {diag_log "Player is JIP, not executing onPlayerRespawn.sqf"};

//notify server
[profileName, originalSide] remoteExec ["mcd_fnc_removeRespawnedFromList",2,false];
