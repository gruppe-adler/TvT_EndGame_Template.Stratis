params ["_timeOfDeath", "_waitCondition", "_freeRespawn", "_waveTimeLeft", "_rule", "_lineBreak", "_playersLeft"];

//respawn countdown ============================================================
PLAYER_RESPAWNTIME = RESPAWNTIME;
[{
    params ["_args", "_handle"];
    _args params ["_timeOfDeath", "_waitCondition", "_freeRespawn", "_waveTimeLeft", "_rule", "_lineBreak", "_playersLeft"];
    if (PLAYER_RESPAWNTIME <= 0) exitWith {
        [_handle] call CBA_fnc_removePerFrameHandler;
        [_timeOfDeath, _waitCondition, _freeRespawn, _waveTimeLeft, _rule, _lineBreak, _playersLeft] call endgame_fnc_waveRespawnWait;
    };

    if (!(call _waitCondition) && call _freeRespawn) exitWith {
        [_handle] call CBA_fnc_removePerFrameHandler;
        [_rule, _lineBreak] call endgame_fnc_handleRespawn;
        diag_log "fn_playerRespawnWait.sqf - free respawn at FOB, breaking countdown";
    };

    if (GAMEPHASE >= 3) exitWith {
        [_handle] call CBA_fnc_removePerFrameHandler;
        [] call endgame_fnc_startSpectator;
    };
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
},1,[_timeOfDeath, _waitCondition, _freeRespawn, _waveTimeLeft, _rule, _lineBreak, _playersLeft]] call CBA_fnc_addPerFrameHandler;
