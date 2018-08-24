/*  Ends mission for player when public variable is received
*   executed on player via init.sqf
*/
#include "../script_component.hpp"

if !(_this select 1) exitWith {};
_winningSide = _this select 0;
_isVictory = false;
if (_winningSide == GVARMAIN(ORIGINALSIDE)) then {
    _isVictory = true;
};

_endText = switch (_winningSide) do {
    case "WEST": {"BLUFOR WINS"};
    case "EAST": {"OPFOR WINS"};
    case "DRAW": {"UNENTSCHIEDEN"};
 };

[] call endgame_fnc_removeTaskForReplay;
// stops record, sends data and starts replay
[] call GRAD_replay_fnc_stopRecord;

// ends mission after replay is over
[{
    missionNamespace getVariable ["REPLAY_FINISHED",false]
}, {
    params ["_endText", "_isVictory"];
    _text = format ["<img size= '6' style='vertical-align:middle' shadow='false' image='data\gruppe-adler.paa'/><br/><t size='.9' color='#FFFFFF'>%1</t>", _endText];
    [_text,0,0,2,2] spawn BIS_fnc_dynamicText;
    ["end1", _isVictory, true, true, true] spawn BIS_fnc_endMission;
}, [_endText, _isVictory]] call CBA_fnc_waitUntilAndExecute;
