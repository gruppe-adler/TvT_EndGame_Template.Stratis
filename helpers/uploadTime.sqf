/*  Adjusts upload speed in phase 3
*
*   executed on server and clients via init.sqf and initPlayerLocal.sqf
*/


if ((_this select 0) == "SERVER" && hasInterface) exitWith {};
if (isNil "UPLOADSPEED") then {UPLOADSPEED = 1};
waitUntil {sleep 10; GAMEPHASE == 3};


_allfound = false;
_i = 1;
while {!_allfound} do {
  if (isNil "obj_upload_1") exitWith {diag_log "uploadTime.sqf - ERROR: CANT FIND obj_upload_1"};

  call compile format ["
    if (isNull obj_upload_%1) exitWith {};
    [] spawn {
      while {GAMEPHASE == 3} do {
        waitUntil {sleep 1; (obj_upload_%1 getVariable ['BIS_download_speed', 0]) != 0};
        sleep 0.5;
        diag_log 'uploadTime.sqf - Uploading. Setting upload speed on obj_upload_%1 to %2.';
        obj_upload_%1 setvariable ['BIS_download_speed', %2, false];
        waitUntil {sleep 2; (obj_upload_%1 getVariable ['BIS_download_speed', 0]) == 0};
        diag_log 'uploadTime.sqf - Upload on obj_upload_%1 interrupted. Waiting for next upload attempt.';
      };
    };
  ", _i, UPLOADSPEED];

  _i = _i + 1;
  _allfound = call compile format ["isNil 'obj_upload_%1'", _i];
};

diag_log format ["uploadTime.sqf - Added new upload time loop to %1 upload objects.", _i-1];
