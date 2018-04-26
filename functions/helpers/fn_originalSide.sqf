/*  creates a reliable side variable
*   (side player might be CIV when unconscious)
*
*   executed on player via init.sqf
*/

waitUntil {!isNull player};
waitUntil {alive player};

originalSide = "CIV";
while {originalSide == "CIV"} do {
  originalSide = str side player;
};
