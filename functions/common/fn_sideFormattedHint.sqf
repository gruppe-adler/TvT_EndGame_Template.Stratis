/*  Calls fn_formattedHint for one side only
*
*   Params:
*   0: side
*   1: params for fn_formattedHint
*/
#include "../script_component.hpp"

params ["_side", "_hintParams"];

if (!hasInterface) exitWith {};
if (side player != _side) exitWith {};

[_hintParams] call endgame_fnc_formattedHint;
