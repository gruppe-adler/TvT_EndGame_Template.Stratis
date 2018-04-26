/*  Determines respawn wave size
*   executed via init.sqf on player and server
*/

_waveSize = (["wavesize", 0] call BIS_fnc_getParamValue);
if (_waveSize == 0) then {
  RESPAWNWAVESIZE = ceil (((count ([] call BIS_fnc_listPlayers)) / 2) / 3);
} else {
  RESPAWNWAVESIZE = _waveSize;
};
publicVariable "RESPAWNWAVESIZE";
diag_log format ["Respawn wave size is %1", RESPAWNWAVESIZE];
