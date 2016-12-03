/*  Ends game if all players of one side are dead in phase 3
*   by @nomisum for Breaking Contact
*
*   executed via init.sqf on server
*/

// win conditions, detected by server only
if (!isServer) exitWith {};

//wait until everyone has respawned
waitUntil {GAMEPHASE == 3};
sleep 15;
diag_log "detectAllDead.sqf starting...";

checkForReal = {
	private ["_isEliminated"];
	params ["_varName", "_check"];

	for [{_i=0}, {_i<20}, {_i=_i+1}] do
	{
		_isEliminated = call _check;
		if (!_isEliminated) exitWith {};
		sleep 0.5;
	};
	if (_isEliminated && _varName == "OPFOR_PRE_ELIMINATED") then {OPFOR_ELIMINATED = true;};
	if (_isEliminated && _varName == "BLUFOR_PRE_ELIMINATED") then {BLUFOR_ELIMINATED = true;};
};

[] spawn {
    while {true} do {
		_checkOpfor = {({side _x == east} count playableUnits) + ({side _x == east} count switchableUnits) == 0};
		_checkBlufor = {({side _x == west} count playableUnits)  + ({side _x == west} count switchableUnits) == 0};
        OPFOR_PRE_ELIMINATED = call _checkOpfor;
        BLUFOR_PRE_ELIMINATED = call _checkBlufor;

        if (OPFOR_PRE_ELIMINATED) then {["OPFOR_PRE_ELIMINATED", _checkOpfor] spawn checkForReal;};
        if (BLUFOR_PRE_ELIMINATED) then {["BLUFOR_PRE_ELIMINATED", _checkBlufor] spawn checkForReal;};

        if (OPFOR_ELIMINATED || BLUFOR_ELIMINATED) exitWith {
            publicVariable "OPFOR_ELIMINATED";
            publicVariable "BLUFOR_ELIMINATED";
        };
        sleep 11;
    };
};
