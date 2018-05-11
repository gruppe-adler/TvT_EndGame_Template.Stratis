#include "USERSCRIPTS\missionSettings.sqf";

//PLAYER ONLY ==================================================================
if (hasInterface) then {

      waitUntil {!isNil "RESPAWNWAVESIZE"};
      joinTime = serverTime;
      originalSide = str (side player);

      "OPFOR_ELIMINATED" addPublicVariableEventHandler {["WEST", _this select 1] call mcd_fnc_endMission};
      "BLUFOR_ELIMINATED" addPublicVariableEventHandler {["EAST", _this select 1] call mcd_fnc_endMission};
      "ENDINDRAW" addPublicVariableEventHandler {["DRAW", _this select 1] call mcd_fnc_endMission};

      [] call endgame_fnc_intro;
      [] call endgame_fnc_removeAreaMarkers;
      [] call endgame_fnc_removeCarrierMarker;
      [] call endgame_fnc_civKillListener;
      [] call endgame_fnc_civGunfightListener;
      [{[] call endgame_fnc_downloadIconRange;},[],15] call CBA_fnc_waitAndExecute;
      ["player"] call endgame_fnc_uploadTime;

      ["PHASE2"] spawn endgame_fnc_hideTaskMarkers;
      ["PHASE3"] spawn endgame_fnc_hideTaskMarkers;
};
