/*  Replaces spaces in a string with underscores
*
*/

private ["_returnString"];
params ["_inputString"];

_returnString = "";
_allWords = _inputString splitString " ";
{
  _returnString = _returnString + "_" + _x;
} forEach _allWords;

_returnString
