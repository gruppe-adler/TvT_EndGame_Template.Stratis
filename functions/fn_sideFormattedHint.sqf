/*  Calls fn_formattedHint for one side only
*
*   Params:
*   0: side
*   1: params for fn_formattedHint
*/

params ["_side", "_hintParams"];

if (!hasInterface) exitWith {};
if (side player != _side) exitWith {};

[_hintParams] call mcd_fnc_formattedHint;
