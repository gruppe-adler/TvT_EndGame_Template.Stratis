/*  Removes automatic area markers when players enter task area
*   Does this by clearing the area array that is created by bis_fnc_moduleMPTypeHvt_areaManager so that the area manager doesn't have anything to update
*
*   executed on player via init.sqf
*/

waitUntil {sleep 0.1; !isNil "BIS_areaManager_areas"};
sleep 2;
BIS_areaManager_areas = [];
