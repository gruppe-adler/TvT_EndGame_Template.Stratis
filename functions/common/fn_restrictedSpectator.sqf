
_spectatableUnits = [];
{
    if (alive _x) then {
    _spectatableUnits pushBackUnique _x;
    };
} forEach (units group player);
if (count _spectatableUnits < 1) then {
    {
        if ((side _x == originalSide) && (alive _x)) then {
            _spectatableUnits pushBackUnique _x;
        };
    }forEach playableUnits;
};

[[1], [0,2]] call ace_spectator_fnc_updateCameraModes;
[true] call ace_spectator_fnc_setSpectator;
[1, _spectatableUnits select 0] call ace_spectator_fnc_setCameraAttributes;

[_spectatableUnits] spawn {
    params ["_spectatableUnits"];
    sleep 3;
    {
        if !(alive _x) then {_spectatableUnits deleteAt _forEachIndex};
    }forEach _spectatableUnits;
    [_spectatableUnits, (allUnits - _spectatableUnits)] call ace_spectator_fnc_updateUnits;
};
