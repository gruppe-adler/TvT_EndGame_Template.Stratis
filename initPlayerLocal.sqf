#include "USERSCRIPTS\missionsettings.sqf";

//PLAYER ONLY ==================================================================
if (hasInterface) then {

  waitUntil {!isNil "RESPAWNWAVESIZE"};

  mcd_fnc_startSpectator = compile preProcessFileLineNumbers "functions\fn_startSpectator.sqf";
  mcd_fnc_strToLoadout = compile preprocessFileLineNumbers "functions\fn_strToLoadout.sqf";
  mcd_fnc_blockMap = compile preprocessFileLineNumbers "functions\fn_blockMap.sqf";
  mcd_fnc_hideTaskMarkers = compile preprocessFileLineNumbers "functions\fn_hideTaskMarkers.sqf";
  mcd_fnc_triggerToMarker = compile preprocessFileLineNumbers "functions\fn_triggerToMarker.sqf";
  mcd_fnc_formattedHint = compile preprocessFileLineNumbers "functions\fn_formattedHint.sqf";

  joinTime = serverTime;

  [] execVM "helpers\originalSide.sqf";
  [] execVM "helpers\intro.sqf";
  [] execVM "player\endMission.sqf";
  [] execVM "player\removeAreaMarkers.sqf";
  [] execVM "player\removeCarrierMarker.sqf";
  [] execVM "player\civKillListener.sqf";
  [] execVM "player\civGunfightListener.sqf";
  [] execVM "player\downloadIconRange.sqf";
  ["player"] execVM "helpers\uploadTime.sqf";
  if (USECUSTOMLOADOUTS) then {
    [] execVM "loadoutInit.sqf";
  };

  ["PHASE2"] spawn mcd_fnc_hideTaskMarkers;
  ["PHASE3"] spawn mcd_fnc_hideTaskMarkers;
};
