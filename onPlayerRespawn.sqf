/*  Notifies server that player has respawned
*
*   executed locally on respawn
*/

if (USECUSTOMLOADOUTS) then {
  [] execVM "loadoutInit.sqf";
};

//check JIP player is spawning for the first time
if (serverTime-joinTime < 30 && didJIP) exitWith {diag_log "Player is JIP, not executing onPlayerRespawn.sqf"};
[player, false] call TFAR_fnc_forceSpectator;

//notify server
[profileName, originalSide, player] remoteExec ["mcd_fnc_handleRespawned",2,false];

//re-enable map
[false] call mcd_fnc_blockMap;
