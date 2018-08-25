#include "../script_component.hpp"
#include "USERSCRIPTS\missionSettings.sqf";

//PLAYER ONLY ==================================================================
if (hasInterface) then {
      waitUntil {!isNil QGVARMAIN(RESPAWNWAVESIZE)};
      GVARMAIN(JOINTIME) = serverTime;
      GVARMAIN(ORIGINALSIDE) = str (side player);

      QGVARMAIN(OPFOR_ELIMINATED) addPublicVariableEventHandler {["WEST", _this select 1] call EFUNC(,endMission)};
      QGVARMAIN(BLUFOR_ELIMINATED) addPublicVariableEventHandler {["EAST", _this select 1] call EFUNC(,endMission)};
      QGVARMAIN(ENDINDRAW) addPublicVariableEventHandler {["DRAW", _this select 1] call EFUNC(,endMission)};

      [] call EFUNC(setup,intro);
      [] call EFUNC(,removeAreaMarkers);
      [] call EFUNC(,removeCarrierMarker);
      [{[] call EFUNC(,downloadIconRange);},[],15] call CBA_fnc_waitAndExecute;
      ["player"] call EFUNC(,uploadTime);

};
