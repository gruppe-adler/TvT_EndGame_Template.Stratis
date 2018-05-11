#include "USERSCRIPTS\missionsettings.sqf";

//LOADOUTS =====================================================================
["BLU_F", LOADOUTFACTIONBLU] call GRAD_Loadout_fnc_FactionSetLoadout;
["OPF_F", LOADOUTFACTIONOPF] call GRAD_Loadout_fnc_FactionSetLoadout;

if (USEINDEPENDANTLOADOUT) then {
    ["IND_F", LOADOUTFACTIONGREEN] call GRAD_Loadout_fnc_FactionSetLoadout;
};

//ENGIMA TRAFFIC ===============================================================
CIVILIAN_TRAFFIC = ["civiliantraffic", 0] call BIS_fnc_getParamValue;
if (CIVILIAN_TRAFFIC == 1) then {
  [] execVM "node_modules\Engima\Traffic\Init.sqf";
};

[2] call GRAD_replay_fnc_init; // number is precision of replay, 2 means every 2 seconds one snapshot
