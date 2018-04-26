/*    handles player respawn
*
*     executed locally when player dies
*/

private ["PLAYER_RESPAWNTIME","_waveLeft","_minutes","_seconds","_respawnIn", "_explanation"];

//check JIP player is spawning for the first time
if (serverTime-joinTime < 30 && didJIP) exitWith {diag_log "Player is JIP, not executing onPlayerKilled.sqf"};

//exit if phase 3
if (GAMEPHASE >= 3) exitWith {call grad_endgame_common_fnc_startSpectator};

//set max respawn time
if (isNil "MAXRESPAWNTIME") then {MAXRESPAWNTIME = 1200};

//start spectator
[player, true] call TFAR_fnc_forceSpectator;
[] call grad_endgame_common_fnc_restrictedSpectator;
[true] call grad_endgame_common_fnc_blockMap;

//keep player from respawning
_timeOfDeath = time;
setPlayerRespawnTime 9999;
sleep 2;



//declare/define variables =====================================================
_rule = parseText "<t align='center'><t color='#708090'>-----------------------------------------------------<br /></t></t>";
_lineBreak = parseText "<br />";
_waitCondition = {};
_playersLeft = {};
_waveTimeLeft = {};
_freeRespawn = {};
_isFreeRespawn = false;

if (originalSide == "WEST") then {
    _waitCondition = compile "!WAVERESPAWNBLU";
    _freeRespawn = compile "FOBFREERESPAWNBLU";
    _playersLeft = {WAVERESPAWNPLAYERSLEFTBLU};
    _waveTimeLeft = {WAVERESPAWNTIMELEFTBLU};
    diag_log "onPlayerKilled - player side is WEST";
};
if (originalSide == "EAST") then {
    _waitCondition = compile "!WAVERESPAWNOPF";
    _freeRespawn = compile "FOBFREERESPAWNOPF";
    _playersLeft = {WAVERESPAWNPLAYERSLEFTOPF};
    _waveTimeLeft = {WAVERESPAWNTIMELEFTOPF};
    diag_log "onPlayerKilled - player side is EAST";
};



//respawn countdown ============================================================
PLAYER_RESPAWNTIME = RESPAWNTIME;
[{
    params ["_timeOfDeath", "_waitCondition", "_freeRespawn", "_waveTimeLeft"];
    if (!(call _waitCondition) && call _freeRespawn) exitWith {diag_log "onPlayerKilled.sqf - free respawn at FOB, breaking countdown"};

    if (GAMEPHASE >= 3) exitWith {};
    //countdown
    PLAYER_RESPAWNTIME = PLAYER_RESPAWNTIME - 1;
    _minutes = str (floor (PLAYER_RESPAWNTIME/60));
    _seconds = floor (PLAYER_RESPAWNTIME mod 60);
    if (_seconds<10) then {_seconds = "0" + str _seconds} else {_seconds = str _seconds};
    _respawnIn = parseText format ["<t align='center' size='1.4'>%1: <t color='#ffff00'>%2:%3</t></t>", (localize "STR_GRAD_EG_WAVE_PLAYER"), _minutes, _seconds];

    //wave
    _minutes = str (floor (call _waveTimeLeft/60));
    _seconds = floor (call _waveTimeLeft mod 60);
    if (_seconds<10) then {_seconds = "0" + str _seconds} else {_seconds = str _seconds};
    _waveTimeStr = format ["%1:%2", _minutes, _seconds];
    _waveLeft = parseText format ["<t align='center' size='1.4'>%1: <t color='%4'>%2/%3</t> - <t color ='%5'>%6</t></t>", (localize "STR_GRAD_EG_WAVE_WAVE"), RESPAWNWAVESIZE-(call _playersLeft), RESPAWNWAVESIZE, if (call _playersLeft == 0) then {"#00ff00"} else {"#ffff00"},if (call _waveTimeLeft <= 0) then {"#00ff00"} else {"#ffff00"},_waveTimeStr];

    //explanation
    _explanation = parseText format ["<t align ='center' size='1.4'>%1.</t>",(localize "STR_GRAD_EG_WAVE_WAITPLAYER")];

    //max respawn time
    _maxTime = parseText format ["<t align ='center' size='0.7'>%1: %2.</t>",(localize "STR_GRAD_EG_WAVE_JUMPWAVE"), [MAXRESPAWNTIME - (time -_timeOfDeath),"MM:SS"] call BIS_fnc_secondsToString];

    //compose hintSilent
    hintSilent composeText [_rule, _respawnIn, _lineBreak, _waveLeft, _lineBreak, _explanation, _lineBreak, _rule, _maxTime];
},1,[_timeOfDeath, _waitCondition, _freeRespawn, _waveTimeLeft]] call CBA_fnc_addPerFrameHandler;


//send command to server to add player to wave array
[profileName, originalSide] remoteExec ["grad_endgame_common_fnc_addDeadPlayerToWave",2,false];

//wait until enough players in wave ============================================
[{
    if (GAMEPHASE >= 3 && !(call _freeRespawn)) exitWith {call grad_endgame_common_fnc_startSpectator};
    _waitCondition
    _respawnIn = parseText format ["<t align='center' size='1.4'>%1 <t color='#00ff00'>%2</t></t>", (localize "STR_GRAD_EG_WAVE_PLAYER"),(localize "STR_GRAD_EG_WAVE_READY")];
    _minutes = str (floor (call _waveTimeLeft/60));
    _seconds = floor (call _waveTimeLeft mod 60);
    if (_seconds<10) then {_seconds = "0" + str _seconds} else {_seconds = str _seconds};
    _waveTimeStr = format ["%1:%2", _minutes, _seconds];
    _waveLeft = parseText format ["<t align='center' size='1.4'>%1: <t color='%4'>%2/%3</t> - <t color ='%5'>%6</t></t>", (localize "STR_GRAD_EG_WAVE_WAVE"), RESPAWNWAVESIZE-(call _playersLeft), RESPAWNWAVESIZE, if (call _playersLeft == 0) then {"#00ff00"} else {"#ffff00"},if (call _waveTimeLeft <= 0) then {"#00ff00"} else {"#ffff00"},_waveTimeStr];
    if (call _waveTimeLeft > 0) then {
        _explanation = parseText format ["<t align='center' size='1.4'>%1.</t>", (localize "STR_GRAD_EG_WAVE_WAITWAVE")];
    } else {
        _explanation = parseText format ["<t align='center' size='1.4'>%1.</t>", (localize "STR_GRAD_EG_WAVE_WAITPLAYER")];
    };

    //max respawn time
    _maxTime = parseText format ["<t align ='center' size='0.7'>%1: %2.</t>",(localize "STR_GRAD_EG_WAVE_JUMPWAVE"), [MAXRESPAWNTIME - (time -_timeOfDeath),"MM:SS"] call BIS_fnc_secondsToString];

    hintSilent composeText [_rule, _respawnIn, _lineBreak, _waveLeft, _lineBreak, _explanation, _lineBreak, _rule, _maxTime];

    if (time - _timeOfDeath > MAXRESPAWNTIME && (call _playersLeft) >= RESPAWNWAVESIZE-1) exitWith {};
},1,[_timeOfDeath, _waitCondition, _freeRespawn, _waveTimeLeft]] call CBA_fnc_addPerFrameHandler;

sleep 0.5;



//respawn ======================================================================

//respawn hintSilent
_respawning = parseText format ["<t align='center' color='#00ff00' size='1.4'>Respawning...</t>"];
hintSilent composeText [_rule, _respawning, _lineBreak, _rule];
//respawn player
setPlayerRespawnTime 0;
forceRespawn player;

//respawn position only updates on respawn -> if free respawn, setPos manually
if (call _freeRespawn) then {
    waitUntil {!isNull player};
    diag_log "Free respawn at FOB";
    sleep 1;
    if (originalSide == "WEST") then {
        _emptyPos = getMarkerPos "respawn_west" findEmptyPosition [0,10];
        if (str _emptyPos == "[]") then {
            player setPos (getMarkerPos "respawn_west");
        } else {
            player setPos _emptyPos;
        };
    } else {
        _emptyPos = getMarkerPos "respawn_east" findEmptyPosition [0,10];
        if (str _emptyPos == "[]") then {
            player setPos (getMarkerPos "respawn_east");
        } else {
            player setPos _emptyPos;
        };
    };
};

//close hintSilent
sleep 4;
hintSilent "";

//make sure player doesn't instantly respawn next time
sleep 6;
setPlayerRespawnTime 9999;
