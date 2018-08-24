#include "../script_component.hpp"

params ["_rule", "_lineBreak"];
//respawn ======================================================================
//respawn hintSilent
_respawning = parseText format ["<t align='center' color='#00ff00' size='1.4'>%1...</t>",(localize "STR_GRAD_EG_WAVE_RESPAWNING")];
hintSilent composeText [_rule, _respawning, _lineBreak, _rule];
//respawn player
setPlayerRespawnTime 0;
forceRespawn player;

//respawn position only updates on respawn -> if free respawn, setPos manually
if (call _freeRespawn) then {
    waitUntil {!isNull player};
    diag_log "Free respawn at FOB";
    if (originalSide == "WEST") then {
        _emptyPos = getMarkerPos "respawn_west" findEmptyPosition [0,10];
        if (str _emptyPos isEqualTo []) then {
            player setPos (getMarkerPos "respawn_west");
        } else {
            player setPos _emptyPos;
        };
    } else {
        _emptyPos = getMarkerPos "respawn_east" findEmptyPosition [0,10];
        if (_emptyPos isEqualTo []) then {
            player setPos (getMarkerPos "respawn_east");
        } else {
            player setPos _emptyPos;
        };
    };
};

//close hintSilent
[{hintSilent "";},[],4] call CBA_fnc_waitAndExecute;

//make sure player doesn't instantly respawn next time
[{setPlayerRespawnTime 9999;},[],10] call CBA_fnc_waitAndExecute;
