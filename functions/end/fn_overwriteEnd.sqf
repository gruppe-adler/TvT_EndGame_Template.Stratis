#include "../script_component.hpp"

[{SCHEMATICSVISIBLE},{
    {
        [{(_this getVariable ["BIS_download_progress", 0.0]>= 0.99)},{
            params ["_obj"];
            _side = _obj getVariable ["BIS_download_side", sideUnknown];
            _obj setVariable ["BIS_download_side", sideUnknown];

            [] call endgame_fnc_removeTaskForReplay;
            // stops record, sends data and starts replay
            [] call GRAD_replay_fnc_stopRecord;

            // ends mission after replay is over
            [{
                missionNamespace getVariable ["REPLAY_FINISHED",false]
            }, {
                params ["_obj", "_side"];
                _obj setVariable ["BIS_download_side", _side];
            }, [_obj, _side]] call CBA_fnc_waitUntilAndExecute;
        },_x] call CBA_fnc_waitUntilAndExecute;
    }forEach (BIS_hvt_pickupInfo select 4);
},[]] call CBA_fnc_waitUntilAndExecute;
