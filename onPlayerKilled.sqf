/*    handles player respawn
*     executed locally when player dies
*/

private ["_waveLeft","_minutes","_seconds","_respawnIn", "_explanation"];

//check JIP player is spawning for the first time
if (serverTime-GVARMAIN(JOINTIME) < 30 && didJIP) exitWith {diag_log "Player is JIP, not executing onPlayerKilled.sqf";};

//exit if phase 3
if (GVARMAIN(GAMEPHASE) >= 3) exitWith {[] call endgame_fnc_startSpectator;};

//set max respawn time
if (isNil "GVARMAIN(MAXRESPAWNTIME)") then {GVARMAIN(MAXRESPAWNTIME) = 1200;};

//start spectator
[player, true] call TFAR_fnc_forceSpectator;
[] call endgame_fnc_restrictedSpectator;
[true] call endgame_fnc_blockMap;

//keep player from respawning
_timeOfDeath = time;
setPlayerRespawnTime 9999;

//declare/define variables =====================================================
_rule = parseText "<t align='center'><t color='#708090'>-----------------------------------------------------<br /></t></t>";
_lineBreak = parseText "<br />";
_waitCondition = {};
_playersLeft = {};
_waveTimeLeft = {};
_freeRespawn = {};

if (GVARMAIN(ORIGINALSIDE) == "WEST") then {
    _waitCondition = compile "!GVARMAIN(WAVERESPAWNBLU)";
    _freeRespawn = compile QGVARMAIN(FOBFREERESPAWNBLU);
    _playersLeft = {GVARMAIN(WAVERESPAWNPLAYERSLEFTBLU)};
    _waveTimeLeft = {GVARMAIN(GVARMAIN(WAVERESPAWNTIME)LEFTBLU)};
    diag_log "onPlayerKilled - player side is WEST";
};
if (GVARMAIN(ORIGINALSIDE) == "EAST") then {
    _waitCondition = compile "!GVARMAIN(WAVERESPAWNOPF)";
    _freeRespawn = compile QGVARMAIN(FOBFREERESPAWNOPF);
    _playersLeft = {GVARMAIN(WAVERESPAWNPLAYERSLEFTOPF)};
    _waveTimeLeft = {GVARMAIN(GVARMAIN(WAVERESPAWNTIME)LEFTOPF)};
    diag_log "onPlayerKilled - player side is EAST";
};

if (GVARMAIN(GAMEPHASE) >= 3) exitWith {[] call endgame_fnc_startSpectator;};

[_timeOfDeath, _waitCondition, _freeRespawn, _waveTimeLeft, _rule, _lineBreak, _playersLeft] call endgame_fnc_playerRespawnWait;
