/*  Notifies server that player has respawned
*
*   executed locally on respawn
*/

[str player, originalSide] remoteExec ["mcd_fnc_removeRespawnedFromList",2,false];
