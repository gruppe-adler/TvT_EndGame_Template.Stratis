/*  Replaces Umlauts in a string
*
*/

private ["_returnString"];
params ["_inputString"];

_returnString = "";
_letterArray = _inputString splitString "";

diag_log str _letterArray;

_aumlautID = 0;
while {_aUmlautID != -1} do {
  _returnString = _letterArray joinString "";
  _aUmlautID = [_returnString, "ä"] call CBA_fnc_find;
  if (_aUmlautID != -1) then {
    _letterArray set [_aUmlautID, "ae"];
  };
};

_uUmlautID = 0;
while {_uUmlautID != -1} do {
  _returnString = _letterArray joinString "";
  _uUmlautID = [_returnString, "ü"] call CBA_fnc_find;
  if (_uUmlautID != -1) then {
    _letterArray set [_uUmlautID, "ue"];
  };
};

_oUmlautID = 0;
while {_oUmlautID != -1} do {
  _returnString = _letterArray joinString "";
  _oUmlautID = [_returnString, "ö"] call CBA_fnc_find;
  if (_oUmlautID != -1) then {
    _letterArray set [_oUmlautID, "oe"];
  };
};


_returnString = _letterArray joinString "";
_returnString = str parseText _returnString;
_spaceSplit = _returnString splitString " ";

asd3 = _returnString;
asd2 = _spaceSplit;

/*
_spaceID = 0;
while {_spaceID != -1} do {
  _returnString = _letterArray joinString "";

  _spaceID = [_returnString, " "] call CBA_fnc_find;
  if (_spaceID != -1) then {
    _letterArray deleteAt _spaceID;
  };
};*/

_returnString = _letterArray joinString "";
_returnString
