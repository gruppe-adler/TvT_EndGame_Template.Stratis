waitUntil {!isNull player};
waitUntil {player == player};
waitUntil {!isNil "originalSide"};
diag_log "startLoadout.sqf starting...";

if (roleDescription player == "") exitWith {diag_log "loadoutInit.sqf - PLAYER HAS NO ROLE DESCRIPTION!"};

//DEFAULT EQUIPMENT ============================================================
_empty = {
	diag_log "PLAYER EQUIPMENT NOT FOUND!";
};

//ADD EQUIPMENT ================================================================
//Add Blufor
if (originalSide == "WEST") then {
	#include "bluforLoadouts.sqf";
	_role = compile ("call " + ([roleDescription player] call mcd_fnc_strReplaceSpaces));
	diag_log format ["Getting loadout: %1", _role];
	call _role;
};

//Add Opfor
if (originalSide == "EAST") then {
	#include "opforLoadouts.sqf";
	_role = compile ("call " + ([roleDescription player] call mcd_fnc_strReplaceSpaces));
	diag_log format ["Getting loadout: %1", _role];
	call _role;
};
