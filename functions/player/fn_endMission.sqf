/*  Ends mission for player when public variable is received
*
*   executed on player via init.sqf
*/

endgame_fnc_endMission = {
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


  sleep 5;
  // stops record, sends data and starts replay
  call GRAD_replay_fnc_stopRecord;

  // ends mission after replay is over
    [{
    	REPLAY_FINISHED
    }, {
        params ["_isVictory","_text"];
        [_text,0,0,2,2] spawn BIS_fnc_dynamicText;
        ["end1", _this, true, true, true] spawn BIS_fnc_endMission;
    }, [_isVictory,_text]] call CBA_fnc_waitUntilAndExecute;
};

"OPFOR_ELIMINATED" addPublicVariableEventHandler {["WEST", _this select 1] spawn endgame_fnc_endMission};
"BLUFOR_ELIMINATED" addPublicVariableEventHandler {["EAST", _this select 1] spawn endgame_fnc_endMission};
"ENDINDRAW" addPublicVariableEventHandler {["DRAW", _this select 1] spawn endgame_fnc_endMission};
