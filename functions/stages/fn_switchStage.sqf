#include "../script_component.hpp"

params ["_side"];

if (GVARMAIN(GAMEPHASE) == 2 && Endgame_oneSideNextPhase) exitWith {
   [_side] call endgame_fnc_callHelo;
   [_side] call endgame_fnc_revealObjectives;
   [_side] call endgame_fnc_hintFobCapture;
   Endgame_oneSideNextPhase = false;
};

switch (GVARMAIN(GAMEPHASE)) do {
   case 1 : {
      [_side] call endgame_fnc_callHelo;
      [_side] call endgame_fnc_revealObjectives;
      [_side] call endgame_fnc_hintFobCapture;
      Endgame_oneSideNextPhase = true;
      GVARMAIN(GAMEPHASE) = 2;
   };
   case 2 : {
      [] call endgame_fnc_showScematics;
      [] call endgame_fnc_skipToEndgame;
   };
   case 3 : {
      private _uploadPos = [] call endgame_fnc_chooseUplodePos;
      [_uploadPos] call endgame_fnc_uploadProtection;
      [_uploadPos] call endgame_fnc_handleRevealUploadPos;
   };
};
