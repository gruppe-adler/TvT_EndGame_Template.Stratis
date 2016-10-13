[allUnits, true] call ace_spectator_fnc_updateUnits;
[units group player, false] call ace_spectator_fnc_updateUnits;
[[1], [0,2]] call ace_spectator_fnc_updateCameraModes;
[true] call ace_spectator_fnc_setSpectator;
