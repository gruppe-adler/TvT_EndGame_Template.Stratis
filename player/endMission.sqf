/*  Ends mission for player when public variable is received
*
*   executed on player via init.sqf
*/

mcd_fnc_endMission = {
  if !(_this select 1) exitWith {};
  _winningSide = _this select 0;
  _isVictory = false;
  if (_winningSide == originalSide) then {
    _isVictory = true;
  };

  _endText = switch (_winningSide) do {
    case "WEST": {"BLUFOR WINS"};
    case "EAST": {"OPFOR WINS"};
    case "DRAW": {"UNENTSCHIEDEN"};
  };

  _text = format ["<img size= '6' style='vertical-align:middle' shadow='false' image='data\gruppe-adler.paa'/><br/><t size='.9' color='#FFFFFF'>%1</t>", _endText];
  [_text,0,0,2,2] spawn BIS_fnc_dynamicText;

  sleep 5;

  ["end1", _isVictory, true, true, true] spawn BIS_fnc_endMission;
};

"OPFOR_ELIMINATED" addPublicVariableEventHandler {["WEST", _this select 1] spawn mcd_fnc_endMission};
"BLUFOR_ELIMINATED" addPublicVariableEventHandler {["EAST", _this select 1] spawn mcd_fnc_endMission};
"ENDINDRAW" addPublicVariableEventHandler {["DRAW", _this select 1] spawn mcd_fnc_endMission};
