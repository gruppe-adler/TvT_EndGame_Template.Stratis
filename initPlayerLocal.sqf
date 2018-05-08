#include "USERSCRIPTS\missionSettings.sqf";

//PLAYER ONLY ==================================================================
if (hasInterface) then {

      waitUntil {!isNil "RESPAWNWAVESIZE"};
      joinTime = serverTime;

      originalSide = "CIV";
      while {originalSide == "CIV"} do {
        originalSide = str side player;
      };

      [] call endgame_fnc_intro;
      [] call endgame_fnc_endMission;
      [] call endgame_fnc_removeAreaMarkers;
      [] call endgame_fnc_removeCarrierMarker;
      [] call endgame_fnc_civKillListener;
      [] call endgame_fnc_civGunfightListener;
      [] call endgame_fnc_downloadIconRange;
      ["player"] call endgame_fnc_uploadTime;

      ["PHASE2"] call endgame_fnc_hideTaskMarkers;
      ["PHASE3"] call endgame_fnc_hideTaskMarkers;
};
