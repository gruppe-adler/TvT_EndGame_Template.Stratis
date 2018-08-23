/*  Makes sure mission ends after time is up
*
*   executed via init.sqf on server
*/

[{Endgame_Gamephase == 3},{
    _startTime = time;
    _timeLimit = (moduleEndGame getVariable "timelimit") + 10;

    [{(time - (_this select 0)) > (_this select 1)},{
        [] call endgame_fnc_removeTaskForReplay;
        // stops record, sends data and starts replay
        call GRAD_replay_fnc_stopRecord;

        // ends mission after replay is over
        [{
            missionNamespace getVariable ["REPLAY_FINISHED",false]
        }, {
            ENDINDRAW = true;
            publicVariable "ENDINDRAW";
        }, []] call CBA_fnc_waitUntilAndExecute;
    },[_startTime, _timeLimit]] call CBA_fnc_waitUntilAndExecute;
},[]] call CBA_fnc_waitUntilAndExecute;
