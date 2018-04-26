#include "USERSCRIPTS\missionsettings.sqf";

//LOADOUTS =====================================================================
["BLU_F", LOADOUTFACTIONBLU] call GRAD_Loadout_fnc_FactionSetLoadout;
["OPF_F", LOADOUTFACTIONOPF] call GRAD_Loadout_fnc_FactionSetLoadout;

//ENGIMA TRAFFIC ===============================================================
CIVILIAN_TRAFFIC = ["civiliantraffic", 0] call BIS_fnc_getParamValue;
if (CIVILIAN_TRAFFIC == 1) then {
  [] execVM "node_modules\Engima\Traffic\Init.sqf";
};
