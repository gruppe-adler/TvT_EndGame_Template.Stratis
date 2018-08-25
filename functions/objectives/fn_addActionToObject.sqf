#include "../script_component.hpp"

params [
   "_target",
   ["_condition", {GVARMAIN(GAMEPHASE) == 2}],
   ["_statement", {[_player, _target] call FUNC(progressBar)}],
   ["_name", "Download Intel"],
   ["_icon", ""]
];


private _action = [(_target + _name),_name,_icon,_statement,_condition] call ace_interact_menu_fnc_createAction;
[_target, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;
