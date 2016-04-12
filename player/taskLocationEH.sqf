/*  Adds eventhandler that spawns mcd_fnc_taskLocation
*
*   executed via init.sqf on players
*/

waitUntil {!isNull player};
waitUntil {player == player};
waitUntil {!isNil "originalSide"};
diag_log "taskLocationEH.sqf staring...";

//LOCALHOST
if (isServer && !isDedicated) then {
  if (originalSide == "WEST") then {
    waitUntil {fobEstBlu};
    ["MAIN"] spawn mcd_fnc_taskLocation;
  };

  if (originalSide == "EAST") then {
    waitUntil {fobEstOpf};
    ["MAIN"] spawn mcd_fnc_taskLocation;
  };

//DEDICATED
} else {
  if (originalSide == "WEST") then {
    "fobEstBlu" addPublicVariableEventHandler {if (fobEstBlu) then {["MAIN"] spawn mcd_fnc_taskLocation}};
  };

  if (originalSide == "EAST") then {
    "fobEstOpf" addPublicVariableEventHandler {if (fobEstBlu) then {["MAIN"] spawn mcd_fnc_taskLocation}};
  };
};
