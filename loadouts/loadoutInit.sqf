/*	executes loadout scripts defined in bluforLoadouts.sqf and opforLoadouts.sqf
*
*		executed on player via init.sqf
*/

waitUntil {!isNull player};
waitUntil {player == player};
waitUntil {!isNil "originalSide"};
diag_log "startLoadout.sqf starting...";

if (roleDescription player == "") exitWith {diag_log "loadoutInit.sqf - PLAYER HAS NO ROLE DESCRIPTION!"};

//load blufor
if (originalSide == "WEST") then {
	#include "bluforLoadouts.sqf";
	_role = [[roleDescription player] call mcd_fnc_strReplaceSpaces] call mcd_fnc_strReplaceUmlauts;
	if (isNil _role) exitWith {diag_log format ["loadoutInit.sqf - LOADOUT FOR %1 NOT FOUND!", _role]};
	diag_log format ["Getting loadout: %1", _role];
	call compile ("call " + _role);
};

//load opfor
if (originalSide == "EAST") then {
	#include "opforLoadouts.sqf";
	_role = [[roleDescription player] call mcd_fnc_strReplaceSpaces] call mcd_fnc_strReplaceUmlauts;
	if (isNil _role) exitWith {diag_log format ["loadoutInit.sqf - LOADOUT FOR %1 NOT FOUND!", _role]};
	diag_log format ["Getting loadout: %1", _role];
	call compile ("call " + _role);
};
