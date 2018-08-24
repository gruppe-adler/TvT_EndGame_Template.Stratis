params ["_side"];

private _helo = switch(_side) do {
   case "WEST" : {B_Helo_Fob};
   case "EAST" : {O_Helo_Fob};
   default {objNull};
};

if (isNull _helo) exitWith {};

_helo enableSimulationGlobal true;
_helo engineOn true;

if ((currentWaypoint (group (driver _helo))) == 0) then {
   private _fobPos = switch(_side) do {
      case "WEST" : {(getPos B_FOB)};
      case "EAST" : {(getPos O_FOB)};
   };
   private _nearestHeloPad = nearestObject [_fobPos, "Land_HelipadEmpty_F"];
   if (isNull _nearestHeloPad) exitWith {};

      private _grp = (group (driver _helo));
      private _heloPos = (getPos _helo);

   if !(isNull (getSlingLoad _helo)) then {
      private _posHeloPad = (getPos _nearestHeloPad);
      private _newPos = [, _posHeloPad] call endgame_fnc_calcNewPos;

      private _wpFlyAtDrop =_grp addWaypoint [_newPos, 0];
      _wpFlyAtDrop setWaypointType "Move";
      _wpFlyAtDrop setWaypointSpeed "Limited";

      private _wpDrop =_grp addWaypoint [_posHeloPad, 0];
      _wpDrop setWaypointType "Drop Cargo";
   };

   private _endPos = _heloPos;
   _endPos params ["_endX", "_endY"];
   private _halfMapSize = (worldSize/2);

   switch (true) do {
      case ((_endX >= _halfMapSize) && (_endY >= _halfMapSize)) : {
         _endPos set [0,worldSize];
      	_endPos set [1, worldSize];
      };
      case ((_endX < _halfMapSize) && (_endY < _halfMapSize)) : {
         _endPos set [0,0];
      	_endPos set [1, 0];
      };
      case ((_endX >= _halfMapSize) && (_endY < _halfMapSize)) : {
         _endPos set [0,0];
      	_endPos set [1, worldSize];
      };
      case ((_endX < _halfMapSize) && (_endY >= _halfMapSize)) : {
         _endPos set [0,worldSize];
      	_endPos set [1, 0];
      };
   };

   private _newPos = [(getPos _helo), _endPos] call endgame_fnc_calcNewPos;
   private _wpEnd =_grp addWaypoint [_newPos, 0];
   _wpEnd setWaypointType "Move";
   _wpEnd setWaypointStatements ["true", "deleteVehicle (vehicle this);"];
};
