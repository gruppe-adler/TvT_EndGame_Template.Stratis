/*  Overwrites BIS function that checks if download objective is in 3D icon range.
*   Overwrites BIS MissionEH that draws 3D icon on dowload objective.
*
*   executed via initplayerlocal on clients
*/

sleep 10;

private ["_range"];
if (isNil "DLICONRANGE") then {DLICONRANGE = 15};
if (DLICONRANGE <= 0) then {DLICONACTUALRANGE = 15} else {DLICONACTUALRANGE = DLICONRANGE};


//OVERWRITE SEARCH FUNCTION ====================================================
BIS_fnc_downloadObject_nearObject =
{
	private _nearObjects = nearestObjects [positionCameraToWorld [0,0,0], [], DLICONACTUALRANGE];
	private _downloadableObject = objNull;

	{
		if (_x getVariable ["BIS_hvt_downloadableObject", false] && { !(side group player in (_x getVariable ["BIS_hvt_intelDownloadedBy", []])) }) exitWith
		{
			_downloadableObject = _x;
		};
	}
	forEach _nearObjects;

	_downloadableObject;
};


//OVERWRITE EVENTHANDLER =======================================================
if (DLICONRANGE <= 0) then {
  if (isNil "BIS_downloadObject_draw3D") exitWith {diag_log "downloadIconRange.sqf - ERROR: COULD NOT FIND EVENT HANDLER ID FOR DRAW3D EH."};
  removeMissionEventHandler ["Draw3D", BIS_downloadObject_draw3D];

  BIS_downloadObject_draw3D = addMissionEventHandler ["Draw3D",
  {
  	private _context	= BIS_downloadObject_context;
  	private _nearPlayers	= BIS_downloadObject_players;

  	if (!isNull _context) then
  	{
  		private _oldTickTime 	= missionNamespace getVariable ["BIS_downloadObject_lastTickTime", time];
  		private _newTickTime 	= time;
  		private _deltaTime	= _newTickTime - _oldTickTime;
  		private _iconPosition 	= getPosATLVisual _context;

  		missionNamespace setVariable ["BIS_downloadObject_lastTickTime", _newTickTime];

  		if (typeOf player != "VirtualSpectator_F") then
  		{
  			private _iconColor = [1.0, 1.0, 1.0, 0.5];
  			private _iconAngle = 0;

  			// Icon effects when object is being downloaded
  			if ((_context getVariable ["BIS_download_side", sideUnknown]) != sideUnknown) then
  			{
  				private ["_oldAngle", "_newAngle"];
  				_lastAngle = missionNamespace getVariable ["BIS_downloadObject_lastAngle", 0];
  				_newAngle  = _lastAngle  - (720.0 * _deltaTime);
  				missionNamespace setVariable ["BIS_downloadObject_lastAngle", _newAngle];

  				_iconColor = [0.8, 1.0, 0.8, 0.5];
  				_iconAngle = _newAngle;
  			};

  			// Icon effects when object is being connected to
  			if (!isNull BIS_downloadObject_usedObject) then
  			{
  				private ["_oldAngle", "_newAngle"];
  				_lastAngle = missionNamespace getVariable ["BIS_downloadObject_lastAngle", 0];
  				_newAngle  = _lastAngle  - (360.0 * _deltaTime);
  				missionNamespace setVariable ["BIS_downloadObject_lastAngle", _newAngle];

  				_iconColor = [0.8, 0.8, 0.1, 0.5];
  				_iconAngle = _newAngle;
  			};

  			// Draw icon
  			if ([_context] call BIS_fnc_downloadObject_canSee) then
  			{
  				/*drawIcon3D ["a3\Ui_f\data\Map\Diary\signal_ca.paa", _iconColor, _iconPosition, 1.1, 1.1, _iconAngle, "", 0, 0.03, "PuristaMedium"];*/
  			};
  		};

  		// Draw lines between downloading players and context object
  		if (typeOf player == "VirtualSpectator_F" || { player in _nearPlayers }) then
  		{
  			{
  				private _pos = _x modelToWorldVisual (_x selectionPosition "Spine3");

  				// Draw lines between downloading players and context
  				drawLine3D [_iconPosition, _pos, [0.8, 1.0, 0.8, 0.3]];
  			}
  			forEach _nearPlayers;
  		};

  		// If uploading, draw line between context and pickup object
  		if (!isNil { missionNamespace getVariable ["BIS_hvt_endGame", false] }) then
  		{
  			private _pickup = ["GetPickupObject"] call (missionNamespace getVariable ["bis_fnc_moduleMPTypeHvt_carrier", {}]);

  			if (!isNull _pickup && { _context getVariable ["BIS_download_side", sideUnknown] == side group player || { typeOf player == "VirtualSpectator_F" && { _context getVariable ["BIS_download_side", sideUnknown] != sideUnknown } } }) then
  			{
  				drawLine3D [_iconPosition, getPosATLVisual _pickup, [0.8, 1.0, 0.8, 0.3]];
  			};
  		};
  	};
  }];
};
