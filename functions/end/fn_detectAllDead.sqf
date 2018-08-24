/*  Ends game if all players of one side are dead in phase 3
*   by @nomisum for Breaking Contact
*   executed via init.sqf on server
*/
#include "../script_component.hpp"

// win conditions, detected by server only
if (!isServer) exitWith {};

//wait until everyone has respawned
[{GVARMAIN(GAMEPHASE) == 3},{
	diag_log "detectAllDead.sqf starting...";

	checkForReal = {
		private ["_isEliminated"];
		params ["_varName", "_check"];

		for [{_i=0}, {_i<20}, {_i=_i+1}] do
		{
			_isEliminated = call _check;
			if (!_isEliminated) exitWith {};
		};
		if (_isEliminated && _varName == "OPFOR_PRE_ELIMINATED") then {GVARMAIN(OPFOR_ELIMINATED) = true;};
		if (_isEliminated && _varName == "BLUFOR_PRE_ELIMINATED") then {GVARMAIN(BLUFOR_ELIMINATED) = true;};
	};

	[{
			_checkOpfor = {({side _x == east} count playableUnits) + ({side _x == east} count switchableUnits) == 0};
			_checkBlufor = {({side _x == west} count playableUnits)  + ({side _x == west} count switchableUnits) == 0};
	        OPFOR_PRE_ELIMINATED = call _checkOpfor;
	        BLUFOR_PRE_ELIMINATED = call _checkBlufor;

	        if (OPFOR_PRE_ELIMINATED) then {["OPFOR_PRE_ELIMINATED", _checkOpfor] spawn checkForReal;};
	        if (BLUFOR_PRE_ELIMINATED) then {["BLUFOR_PRE_ELIMINATED", _checkBlufor] spawn checkForReal;};

	        if (GVARMAIN(OPFOR_ELIMINATED) || GVARMAIN(BLUFOR_ELIMINATED)) exitWith {
				[_this select 1] call CBA_fnc_removePerFrameHandler;
				// stops record, sends data and starts replay
	  		  	call GRAD_replay_fnc_stopRecord;

	  		  // ends mission after replay is over
	  		    [{
	  		    	missionNamespace getVariable ["REPLAY_FINISHED",false]
	  		    }, {
		            publicVariable "GVARMAIN(OPFOR_ELIMINATED)";
		            publicVariable QGVARMAIN(BLUFOR_ELIMINATED);
				}, []] call CBA_fnc_waitUntilAndExecute;
			};
	},11,[]] call CBA_fnc_addPerFrameHandler;
}, []] call CBA_fnc_waitUntilAndExecute;
