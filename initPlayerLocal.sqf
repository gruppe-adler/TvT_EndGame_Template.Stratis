//PLAYER ONLY ==================================================================
if (hasInterface) then {

  waitUntil {!isNil "RESPAWNWAVESIZE"};

  mcd_fnc_startSpectator = compile preProcessFileLineNumbers "player\fn_startSpectator.sqf";
  mcd_fnc_strReplaceSpaces = compile preprocessFileLineNumbers "helpers\fn_strReplaceSpaces.sqf";
  mcd_fnc_strReplaceUmlauts = compile preprocessFileLineNumbers "helpers\fn_strReplaceUmlauts.sqf";
  mcd_fnc_taskLocation = compile preprocessFileLineNumbers "player\fn_taskLocation.sqf";

  joinTime = serverTime;

  ["PRELOAD"] call mcd_fnc_taskLocation;
  [] execVM "helpers\originalSide.sqf";
  [] execVM "player\taskLocationEH.sqf";
  [] execVM "helpers\intro.sqf";
  [] execVM "player\endMission.sqf";
  if (USECUSTOMLOADOUTS) then {
    [] execVM "loadouts\loadoutInit.sqf";
  };
};
