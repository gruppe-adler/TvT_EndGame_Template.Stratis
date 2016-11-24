#include "USERSCRIPTS\missionsettings.sqf";

//PLAYER ONLY ==================================================================
if (hasInterface) then {

  waitUntil {!isNil "RESPAWNWAVESIZE"};

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

  ["PHASE2"] spawn mcd_fnc_hideTaskMarkers;
  ["PHASE3"] spawn mcd_fnc_hideTaskMarkers;
};
