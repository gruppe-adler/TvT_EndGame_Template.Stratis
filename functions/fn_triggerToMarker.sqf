/*  Creates marker based on a trigger
*
*   Params:
*   0:  trigger
*   1:  markername (optional)
*   2:  isGlobal (true: global - false: local)
*/
private ["_marker"];

_trigger = param [0];
_markername = param [1, "UNDEFINED"];
_isGlobal = param [2, true];

//generate name if undefined
if (_markername == "UNDEFINED") then {
  _i = 0;
  _markername = format ["triggerToMarker_%1", _i];
  while {getMarkerType _markername != ""} do {
    _i = _i + 1;
    _markername = format ["triggerToMarker_%1", _i];
  };
};

//get trigger properties
_triggerShape = if ((triggerArea _trigger) select 3) then {"RECTANGLE"} else {"ELLIPSE"};
_triggerSizeX = (triggerArea _trigger) select 0;
_triggerSizeY = (triggerArea _trigger) select 1;
_triggerAngle = (triggerArea _trigger) select 2;

//create global marker
if (_isGlobal) then {
  _marker = createMarker [_markername, getPos _trigger];
  _marker setMarkerShape _triggerShape;
  _marker setMarkerSize [_triggerSizeX, _triggerSizeY];
  _marker setMarkerDir _triggerAngle;
  _marker setMarkerColor "COLORGUER";
  _marker setMarkerBrush "SOLIDBORDER";
  _marker setMarkerAlpha 0.4;

//create local maker
} else {
  _marker = createMarkerLocal [_markername, getPos _trigger];
  _marker setMarkerShapeLocal _triggerShape;
  _marker setMarkerSizeLocal [_triggerSizeX, _triggerSizeY];
  _marker setMarkerDirLocal _triggerAngle;
  _marker setMarkerColorLocal "COLORGUER";
  _marker setMarkerBrushLocal "SOLIDBORDER";
  _marker setMarkerAlphaLocal 0.4;
};

//return markername
_marker
