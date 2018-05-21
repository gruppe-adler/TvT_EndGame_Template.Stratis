
_spectatableUnits = [];
{
    if (alive _x) then {
    _spectatableUnits pushBackUnique _x;
    };
} forEach (units group player);
if (count _spectatableUnits <= 1 && (count(playableUnits) > 0)) then {
    {
        if (((str(side _x)) == originalSide) && (alive _x)) then {
            _spectatableUnits pushBackUnique _x;
        };
    }forEach playableUnits;
};

[[1], [0,2]] call ace_spectator_fnc_updateCameraModes;
[true] call ace_spectator_fnc_setSpectator;
[1, _spectatableUnits select 0] call ace_spectator_fnc_setCameraAttributes;

[{
    params ["_spectatableUnits"];
    {
        if !(alive _x) then {_spectatableUnits deleteAt _forEachIndex};
    }forEach _spectatableUnits;
    [_spectatableUnits, (allUnits - _spectatableUnits)] call ace_spectator_fnc_updateUnits;
},[_spectatableUnits],3] call CBA_fnc_waitAndExecute;
