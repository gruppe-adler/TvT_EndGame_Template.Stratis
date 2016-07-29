/*  Replaces the original schematics reveal function with a new one.
*   Original in modules_f_mp_mark\objectives\tasks\endgame.fsm --> post init
*
*   executed on server via init.sqf
*/

private ["_fsmID"];

//wait until original FMS is executed
waitUntil {sleep 10; _fsmID = BIS_moduleHvtObjectivesInstance_endGameObjective getVariable "BIS_moduleHvtObjective_fsm"; !isNil "_fsmID"};

//save variables
_losingSide = _fsmID getFSMVariable "_currentLoosingSide";
_taskIdPickup = _fsmID getFSMVariable "_taskIdPickup";
_taskIdDefend = _fsmID getFSMVariable "_taskIdDefend";
_taskParamsPickup = _fsmID getFSMVariable "_taskParamsPickup";
_taskParamsDefend = _fsmID getFSMVariable "_taskParamsDefend";
_taskTypePickup = _fsmID getFSMVariable "_taskTypePickup";
_taskTypeDefend = _fsmID getFSMVariable "_taskTypeDefend";
_pickup = _fsmID getFSMVariable "_pickup";
_upload = if (_losingSide == WEST) then {BIS_westUpload} else {BIS_eastUpload};

//terminate original reveal function
terminate (_fsmID getFSMVariable "_revealSchematics");
diag_log "overwriteReveal.sqf - original reveal terminated.";

//check missionsetting
if (isNil "SCHEMATICSREVEALTIME") then {SCHEMATICSREVEALTIME = -1};
if (SCHEMATICSREVEALTIME < 0) exitWith {};
diag_log format ["overwriteReveal.sqf - Revealing in %1s.",SCHEMATICSREVEALTIME];
sleep SCHEMATICSREVEALTIME;

//new reveal
_pickupInfo = missionNamespace getVariable ["BIS_hvt_pickupInfo", [objNull, [objNull, "", sideUnknown], "OnCarrier", sideUnknown, []]];
_pickupState = _pickupInfo select 2;
if (_pickupState == "NeedsPickup") then {
  // Create task for the losing side about pickup
  [format["%1_%2", _taskIdPickup, _losingSide], _losingSide, _taskParamsPickup, [_pickup, true], "ASSIGNED", -1, true, true, _taskTypePickup, true] call BIS_fnc_setTask;

  // Cancel task for the losing side about defending upload site
  [format["%1_%2", _taskIdDefend, _losingSide], _losingSide, _taskParamsDefend, getPosATL _upload, "CANCELED", -1, false, true, _taskTypeDefend, true] call BIS_fnc_setTask;

  // Unlock schematics to the losing team too
  ["Unlock"] call bis_fnc_moduleMPTypeHvt_carrier;

  // Conversations
  ["PickupSchematics", _losingSide] call bis_fnc_moduleMPTypeHvt_conversations;

} else {
  diag_log format ["overwriteReveal.sqf - Not revealing. Current state is: %1. Done.", _pickupState];
};
