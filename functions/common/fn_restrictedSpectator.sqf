/*ace_spectator_filterUnits = 2;
ace_spectator_unitList = [];*/

_spectatableUnits = [];
{if (alive _x) then {_spectatableUnits pushBackUnique _x}} forEach (units group player);
if (count _spectatableUnits < 1) then {_spectatableUnits = [player]};

[[1], [0,2]] call ace_spectator_fnc_updateCameraModes;
[true] call ace_spectator_fnc_setSpectator;
[1, _spectatableUnits select 0] call ace_spectator_fnc_setCameraAttributes;

[_spectatableUnits] spawn {
    params ["_spectatableUnits"];
    sleep 1;
    [ace_spectator_unitList, true] call ace_spectator_fnc_updateUnits;
    sleep 2;
    [_spectatableUnits, false] call ace_spectator_fnc_updateUnits;
};
