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

  sleep 1;
  ["end1", _isVictory, true, true, true] spawn BIS_fnc_endMission;
};

"OPFOR_ELIMINATED" addPublicVariableEventHandler {["WEST", _this select 1] spawn mcd_fnc_endMission};
"BLUFOR_ELIMINATED" addPublicVariableEventHandler {["EAST", _this select 1] spawn mcd_fnc_endMission};
