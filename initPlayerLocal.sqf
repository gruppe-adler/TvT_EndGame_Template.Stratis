#include "USERSCRIPTS\missionSettings.sqf";

//PLAYER ONLY ==================================================================
if (hasInterface) then {

      waitUntil {!isNil "RESPAWNWAVESIZE"};
      joinTime = serverTime;

      originalSide = "CIV";
      while {originalSide == "CIV"} do {
        originalSide = str side player;
      };

      [] spawn endgame_fnc_intro;
      [] spawn endgame_fnc_endMission;
      [] spawn endgame_fnc_removeAreaMarkers;
      [] spawn endgame_fnc_removeCarrierMarker;
      [] spawn endgame_fnc_civKillListener;
      [] spawn endgame_fnc_civGunfightListener;
      [] spawn endgame_fnc_downloadIconRange;
      ["player"] call endgame_fnc_uploadTime;

      ["PHASE2"] call endgame_fnc_hideTaskMarkers;
      ["PHASE3"] call endgame_fnc_hideTaskMarkers;
};
