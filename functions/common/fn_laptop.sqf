sleep 1;

if (isServer) then
{
	private ["_laptop"];
	_laptop = [_this, 0, objNull, [objNull]] call BIS_fnc_param;

	BIS_fnc_onLaptopDestruction =
	{
		private ["_laptop"];
		_laptop = [_this, 0, objNull, [objNull]] call BIS_fnc_param;

		private "_nearbyPlayers";
		_nearbyPlayers = [];

		{
			if (_x distance _laptop <= 50) then {
				_nearbyPlayers pushBack _x;
			};
		} forEach playableUnits;

		[[_laptop], "bis_fnc_moduleMPTypeHvt_laptopParticles", _nearbyPlayers, false] call BIS_fnc_mp;
		_laptop setObjectTextureGlobal [0, "a3\Modules_F_MP_Mark\Objectives\images\BrokenLaptopMonitor2.paa"];
		diag_log format ["On laptop destruction %1", _laptop];
	};

	if (!isNull _laptop) then
	{
		// Explosion event handler
		_laptop setVariable ["BIS_hvt_explosionEH", _laptop addEventHandler ["Explosion",
		{
			diag_log format ["Explosion event handler fired for laptop %1", _this select 0];

			if (isNil { (_this select 0) getVariable "BIS_hvt_intelDestroyed" } && !isNil { (_this select 0) getVariable "BIS_hvt_intelDownloadedBy" }) then
			{
				(_this select 0) removeEventHandler ["Explosion", (_this select 0) getVariable ["BIS_hvt_explosionEH", 0]];
				(_this select 0) setVariable ["BIS_hvt_intelDestroyed", objNull, true];
				[_this select 0] call BIS_fnc_onLaptopDestruction;
				diag_log format ["Explosion event handler destroyed laptop %1", _this select 0];
			};
		}]];

		// Hit event handler
		_laptop setVariable ["BIS_hvt_hitEH", _laptop addEventHandler ["Hit",
		{
			diag_log format ["Hit event handler fired for laptop %1", _this select 0];

			if (isPlayer (_this select 1) && isNil { (_this select 0) getVariable "BIS_hvt_intelDestroyed" } && !isNil { (_this select 0) getVariable "BIS_hvt_intelDownloadedBy" }) then
			{
				(_this select 0) removeEventHandler ["Hit", (_this select 0) getVariable ["BIS_hvt_hitEH", 0]];
				(_this select 0) setVariable ["BIS_hvt_intelDestroyed", _this select 1, true];
				[_this select 0] call BIS_fnc_onLaptopDestruction;
				diag_log format ["Hit event handler destroyed laptop %1", _this select 0];
			};
		}]];

		// Log
		diag_log format ["Laptop.sqf: Events added to %1", _laptop];
	} else {
		diag_log "Laptop not found.";
	};
};
