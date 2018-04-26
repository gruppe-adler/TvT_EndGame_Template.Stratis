_CIV_KILLED_POS_listener = {
	0 = [CIV_KILLED_POS] call grad_endgame_player_fnc_civKilledMarker;
};

"CIV_KILLED_POS" addPublicVariableEventHandler _CIV_KILLED_POS_listener;

// runs in SP to emulate addPublicVariableEventHandler (which doesnt work in SP)
if (!isMultiplayer) then {
	_CIV_KILLED_POS_listener spawn {
		waitUntil {CIV_KILLED_POS select 0 != 0};
		[0, CIV_KILLED_POS] call _this;
	};
};
