/*  Removes the carrier 3D and 2D markers
*   Does this by deleting the eventhandlers created by bis_fnc_moduleMPTypeHvt_carrier
*
*   executed on player via init.sqf
*/

waitUntil {!isNil "SHOWCARRIERMARKER"};
waitUntil {sleep 0.1; !isNil "BIS_hvt_pickupDraw2D"};

//Remove 3D EH and overwrite ID variable
removeMissionEventHandler ["Draw3D", BIS_hvt_pickupDraw];
BIS_hvt_pickupDraw = 9999;

if (!SHOWCARRIERMARKER) then {
  //Remove 2D EH and overwrite ID variable
  ((findDisplay 12) displayCtrl 51) ctrlRemoveEventHandler ["Draw",BIS_hvt_pickupDraw2D];
  BIS_hvt_pickupDraw2D = 9999;  
};
