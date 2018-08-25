#include "../script_component.hpp"

params ["_player", "_target"];

[
   (90* GVARMAIN(UPLOADSPEED)),
   [_player, _target],
   {Hint "Finished!"},
   {hint "Failure!"},
   "My Title",
   {((alive _player) && ((_player distance _target) <= GVARMAIN(DLICONRANGE)))}
] call ace_common_fnc_progressBar;
