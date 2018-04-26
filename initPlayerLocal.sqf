#include "USERSCRIPTS\missionSettings.sqf";

//PLAYER ONLY ==================================================================
if (hasInterface) then {

  waitUntil {!isNil "RESPAWNWAVESIZE"};

  joinTime = serverTime;

  [] call grad_endgame_helpers_fnc_originalSide;
  [] call grad_endgame_helpers_fnc_intro;
  [] call grad_endgame_player_fnc_endMission;
  [] call grad_endgame_player_fnc_removeAreaMarkers;
  [] call grad_endgame_player_fnc_removeCarrierMarker;
  [] call grad_endgame_player_fnc_civKillListener;
  [] call grad_endgame_player_fnc_civGunfightListener;
  [] call grad_endgame_player_fnc_downloadIconRange;
  ["player"] call grad_endgame_helpers_fnc_uploadTime;

  ["PHASE2"] call grad_endgame_common_fnc_hideTaskMarkers;
  ["PHASE3"] call grad_endgame_common_fnc_hideTaskMarkers;
};
