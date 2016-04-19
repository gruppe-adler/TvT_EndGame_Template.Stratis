#include "USERSCRIPTS\missionsettings.sqf";

//PLAYER ONLY ==================================================================
if (hasInterface) then {

  waitUntil {!isNil "RESPAWNWAVESIZE"};

  mcd_fnc_startSpectator = compile preProcessFileLineNumbers "player\fn_startSpectator.sqf";
  mcd_fnc_strToLoadout = compile preprocessFileLineNumbers "helpers\fn_strToLoadout.sqf";
  mcd_fnc_taskLocation = compile preprocessFileLineNumbers "player\fn_taskLocation.sqf";

  joinTime = serverTime;

  ["PRELOAD"] call mcd_fnc_taskLocation;
  [] execVM "helpers\originalSide.sqf";
  [] execVM "player\taskLocationEH.sqf";
  [] execVM "helpers\intro.sqf";
  [] execVM "player\endMission.sqf";
  [] execVM "player\removeAreaMarkers.sqf";
  [] execVM "player\removeCarrierMarker.sqf";
  if (USECUSTOMLOADOUTS) then {
    [] execVM "loadoutInit.sqf";
  };
};
