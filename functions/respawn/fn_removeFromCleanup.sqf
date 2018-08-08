/*  Removes dead and important units from remains collector
*
*   executed via init.sqf on server
*/

_allUnits = allUnits;
_noCleanupUnits = allDead;

//find units with rank of at least Major
{
    if (rankID _x >= 5) then {
        _noCleanupUnits pushBackUnique _x;
    };
} forEach allUnits;

//remove units from cleanup
removeFromRemainsCollector _noCleanupUnits;


//repeat, incase some units were not properly initialized the first time
[{
    _allUnits = allUnits;
    _noCleanupUnits = allDead;

    //find units with rank of at least Major
    {
        if (rankID _x >= 5) then {
            _noCleanupUnits pushBackUnique _x;
        };
    } forEach allUnits;

    //remove units from cleanup
    removeFromRemainsCollector _noCleanupUnits;
},[],10] call CBA_fnc_waitAndExecute;
