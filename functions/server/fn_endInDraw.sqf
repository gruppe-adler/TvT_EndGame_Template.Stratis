/*  Makes sure mission ends after time is up
*
*   executed via init.sqf on server
*/

waitUntil {sleep 5; GAMEPHASE == 3};

_startTime = time;
_timeLimit = (moduleEndGame getVariable "timelimit") + 10;

waitUntil {sleep 5; time - _startTime > _timeLimit};

ENDINDRAW = true;
publicVariable "ENDINDRAW";
