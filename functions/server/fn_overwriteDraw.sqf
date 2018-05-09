[{GAMEPHASE == 3},{
    [{(BIS_hvt_timeoutTarget-1) <= time},{
        BIS_hvt_timeoutTarget = BIS_hvt_timeoutTarget + 1800;

        // stops record, sends data and starts replay
        [] call GRAD_replay_fnc_stopRecord;

        // ends mission after replay is over
        [{
            REPLAY_FINISHED
        }, {
            BIS_hvt_timeoutTarget = time;
        }, []] call CBA_fnc_waitUntilAndExecute;
    },[]] call CBA_fnc_waitUntilAndExecute;
},[]] call CBA_fnc_waitUntilAndExecute;
