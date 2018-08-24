#include "../script_component.hpp"
#include "USERSCRIPTS\missionSettings.sqf";

//PLAYER ONLY ==================================================================
if (hasInterface) then {
      waitUntil {!isNil "RESPAWNWAVESIZE"};
      joinTime = serverTime;
      originalSide = str (side player);

      "OPFOR_ELIMINATED" addPublicVariableEventHandler {["WEST", _this select 1] call EFUNC(,endMission)};
      "BLUFOR_ELIMINATED" addPublicVariableEventHandler {["EAST", _this select 1] call EFUNC(,endMission)};
      "ENDINDRAW" addPublicVariableEventHandler {["DRAW", _this select 1] call EFUNC(,endMission)};

      [] call EFUNC(,intro);
      [] call EFUNC(,removeAreaMarkers);
      [] call EFUNC(,removeCarrierMarker);
      [{[] call EFUNC(,downloadIconRange);},[],15] call CBA_fnc_waitAndExecute;
      ["player"] call EFUNC(,uploadTime);

      ["PHASE2"] spawn EFUNC(,hideTaskMarkers);
      ["PHASE3"] spawn EFUNC(,hideTaskMarkers);
};
