if (!isServer) exitWith {};
if (isNil "MAXTIMETOENDGAME") then {MAXTIMETOENDGAME = -1};
if (MAXTIMETOENDGAME < 0) exitWith {};

[{
  private ["_unclaimedObjective"];

  _winningSide = ["GetLeadingSide", []] call bis_fnc_moduleHVTObjectivesInstance;

  //assign random winner to unclaimed objective if even score
  if (_winningSide == sideUnknown) then {
    diag_log "skipToEndgame.sqf - No side is currently leading. Selecting at random.";

    //find unclaimed objective
    _objectives = ["GetAllObjectives", []] call bis_fnc_moduleHVTObjectivesInstance;
    {
      _winners = ["GetWinners", [_x]] call BIS_fnc_moduleHvtObjective;
      if (count _winners == 0) exitWith {
        diag_log format ["skipToEndgame.sqf - Objective %1 is unclaimed.", _x];
        _unclaimedObjective = _x;
      };
    } forEach _objectives;

    //assign winner
    _winningSide = selectRandom [WEST,EAST];
    _unclaimedObjective setVariable ["BIS_moduleHvtObjective_winners", [_winningSide], true];
    diag_log format ["skipToEndgame.sqf - Random winner for phase 2: %1.", _winningSide];
  };

  _losingSide = if (_winningSide == WEST) then {EAST} else {WEST};

  //hint
  [_winningSide, ["Einer unserer Hacker hat die Schematics gefunden!"]] remoteExec ["mcd_fnc_sideFormattedHint", 0, false];
  [_losingSide, ["Ein feindlicher Hacker hat die Schematics vor uns gefunden!"]] remoteExec ["mcd_fnc_sideFormattedHint", 0, false];

  //skip to endgame
  diag_log "skipToEndgame.sqf - Skipping to phase 3.";
  ["SkipToStage", [2]] call bis_fnc_moduleHVTObjectivesInstance;
}, [], MAXTIMETOENDGAME] call CBA_fnc_waitAndExecute;
