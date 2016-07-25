#include "USERSCRIPTS\missionsettings.sqf";

//PLAYER ONLY ==================================================================
if (hasInterface) then {

  waitUntil {!isNil "RESPAWNWAVESIZE"};

  mcd_fnc_startSpectator = compile preProcessFileLineNumbers "functions\fn_startSpectator.sqf";
  mcd_fnc_strToLoadout = compile preprocessFileLineNumbers "functions\fn_strToLoadout.sqf";
  mcd_fnc_blockMap = compile preprocessFileLineNumbers "functions\fn_blockMap.sqf";

  joinTime = serverTime;

  [] execVM "helpers\originalSide.sqf";
  [] execVM "helpers\intro.sqf";
  [] execVM "player\endMission.sqf";
  [] execVM "player\removeAreaMarkers.sqf";
  [] execVM "player\removeCarrierMarker.sqf";
  if (USECUSTOMLOADOUTS) then {
    [] execVM "loadoutInit.sqf";
  };

  [] execVM "player\civKillListener.sqf";
  [] execVM "player\civGunfightListener.sqf";
  ["player"] execVM "helpers\uploadTime.sqf";
};
