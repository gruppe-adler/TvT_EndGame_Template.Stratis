params ["_side"];

if (Endgame_Gamephase == 2 && Endgame_oneSideNextPhase) exitWith {
   [_side] call endgame_fnc_callHelo;
   [_side] call endgame_fnc_revealObjectives;
   [_side] call endgame_fnc_hintFobCapture;
   Endgame_oneSideNextPhase = false;
};

switch (Endgame_Gamephase) do {
   case 1 : {
      [_side] call endgame_fnc_callHelo;
      [_side] call endgame_fnc_revealObjectives;
      [_side] call endgame_fnc_hintFobCapture;
      Endgame_oneSideNextPhase = true;
      Endgame_Gamephase = 2;
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
