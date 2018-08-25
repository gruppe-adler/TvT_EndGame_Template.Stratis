#include "../script_component.hpp"

params ["_timeOfDeath", "_waitCondition", "_freeRespawn", "_waveTimeLeft", "_rule", "_lineBreak", "_playersLeft"];

diag_log "fn_waveRespawnWait.sqf - start";
//send command to server to add player to wave array
[profileName, GVARMAIN(ORIGINALSIDE)] remoteExec ["endgame_fnc_addDeadPlayerToWave",2,false];

//wait until enough players in wave ============================================
[{
    params ["_args", "_handle"];
    _args params ["_timeOfDeath", "_waitCondition", "_freeRespawn", "_waveTimeLeft", "_rule", "_lineBreak", "_playersLeft"];

    if (GVARMAIN(GAMEPHASE) >= 3 && !(call _freeRespawn)) exitWith {
        [_handle] call CBA_fnc_removePerFrameHandler;
        [] call endgame_fnc_startSpectator;
    };

    _respawnIn = parseText format ["<t align='center' size='1.4'>%1 <t color='#00ff00'>%2</t></t>", (localize "STR_GRAD_EG_WAVE_PLAYER"),(localize "STR_GRAD_EG_WAVE_READY")];
    _minutes = str (floor ((call _waveTimeLeft)/60));
    _seconds = floor ((call _waveTimeLeft) mod 60);
    if (_seconds<10) then {_seconds = "0" + str _seconds} else {_seconds = str _seconds};
    _waveTimeStr = format ["%1:%2", _minutes, _seconds];
    _waveLeft = "";
    if (call compile(format ["FOBEST%1", if (GVARMAIN(ORIGINALSIDE) == "WEST") then {"BLU"}else{"OPF"}])) then {
        _waveLeft = parseText format ["<t align='center' size='1.4'>%1: <t color='%4'>%2/%3</t> - <t color ='%5'>%6</t></t>", (localize "STR_GRAD_EG_WAVE_WAVE"), GVARMAIN(RESPAWNWAVESIZE)-(call _playersLeft), GVARMAIN(RESPAWNWAVESIZE), if (call _playersLeft == 0) then {"#00ff00"} else {"#ffff00"},if (call _waveTimeLeft <= 0) then {"#00ff00"} else {"#ffff00"},_waveTimeStr];
    }else{
        _waveLeft = parseText format ["<t align='center' size='1.4' color='#cc0000'>%1.</t>",(localize "STR_GRAD_EG_WAVE_FOB")]
    };
    _explanation = "";
    if (call _waveTimeLeft > 0) then {
        _explanation = parseText format ["<t align='center' size='1.4'>%1.</t>", (localize "STR_GRAD_EG_WAVE_WAITWAVE")];
    } else {
        _explanation = parseText format ["<t align='center' size='1.4'>%1.</t>", (localize "STR_GRAD_EG_WAVE_WAITFORPLAYERS")];
    };

    //max respawn time
    _maxTime = parseText format ["<t align ='center' size='0.7'>%1: %2.</t>",(localize "STR_GRAD_EG_WAVE_JUMPWAVE"), [GVARMAIN(MAXRESPAWNTIME) - (time -_timeOfDeath),"MM:SS"] call BIS_fnc_secondsToString];

    hintSilent composeText [_rule, _respawnIn, _lineBreak, _waveLeft, _lineBreak, _explanation, _lineBreak, _rule, _maxTime];

    if ((time - _timeOfDeath) > GVARMAIN(MAXRESPAWNTIME)) exitWith {
        [_handle] call CBA_fnc_removePerFrameHandler;
        [_rule, _lineBreak] call endgame_fnc_handleRespawn;
    };

    if !(call _waitCondition) exitWith {
        diag_log format ["fn_waveRespawnWait.sqf - going after Condition %1", (call _waitCondition)];
        [_handle] call CBA_fnc_removePerFrameHandler;
        [_rule, _lineBreak] call endgame_fnc_handleRespawn;
    };
},1,[_timeOfDeath, _waitCondition, _freeRespawn, _waveTimeLeft, _rule, _lineBreak, _playersLeft]] call CBA_fnc_addPerFrameHandler;
