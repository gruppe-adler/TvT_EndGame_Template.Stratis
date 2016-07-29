/*  Spawns friendly AI at upload position for each team
*
*   executed via init.sqf on server
*/

if (isNil "FRIENDLYUPLOADAI") then {FRIENDLYUPLOADAI = false};
if (!FRIENDLYUPLOADAI) exitWith {};
waitUntil {sleep 5; SCHEMATICSVISIBLE};

private ["_amount"];
#include "uploadSoldierConfig.sqf"
#define buildingfactor 0.5


//get amount ===================================================================
if (typeName FRIENDLYAIAMOUNT == "ARRAY") then {
  _amount = (FRIENDLYAIAMOUNT select 0) + (random ((FRIENDLYAIAMOUNT select 1) - (FRIENDLYAIAMOUNT select 0)));
  _amount = round _amount;
} else {
  _amount = FRIENDLYAIAMOUNT;
};
diag_log format ["uploadSoldiers.sqf - Spawning %1 AI per side in a radius of %2.", _amount, FRIENDLYAIRADIUS];

//spawn function ===============================================================
_mcd_fnc_spawnULGroup = {
  params ["_side", "_groupPos", "_units", "_patrol"];
  _newGroup = createGroup _side;
  _newGroup setFormation 'WEDGE';
  _newGroup setCombatMode 'YELLOW';
  _newGroup setBehaviour 'AWARE';
  _newGroup setSpeedMode 'NORMAL';
  if (count _units == 0) exitWith {};
  {
    _spawnPos = _groupPos findEmptyPosition [0,10];
    if (str _spawnPos == "[]") then {_spawnPos = _groupPos};
    _newUnit = _newGroup createUnit [_x, _spawnPos, [], 0, 'CAN_COLLIDE'];
  } forEach _units;

  if (_patrol) then {
    /*[_newGroup,getPos (leader _newGroup),25] call BIS_fnc_taskPatrol;*/
    [_newGroup, getPos (leader _newGroup), 50, (round random 5) max 2, "MOVE", "SAFE", "YELLOW", "LIMITED"] call CBA_fnc_taskPatrol;
  };
};

//spawn units ==================================================================
sleep 2;
{
  _objective = _x;
  _spawnsLeft = _amount;

  //get side of objective
  _side = _objective getvariable "BIS_hvt_downloadableOwnerSide";
  _availableUnits = if (_side == WEST) then {call compile ("_"+BLUFORAIFACTION)} else {call compile ("_"+OPFORAIFACTION)};
  if (isNil "_availableUnits") exitWith {diag_log format ["uploadSoldiers.sqf - ERROR: UNITS ARRAY FOR SIDE %1 NOT FOUND IN uploadSoldierConfig.sqf", _side]};
  diag_log format ["uploadSoldiers.sqf - Upload objective %1 belongs to side %2.", _objective, _side];

  //find buildings in spawnradius
  _houseList =  (getPos _objective) nearObjects ["House",FRIENDLYAIRADIUS];
  {
  	_buildingPos = _x buildingPos 0;
  	if ((str _buildingPos) == "[0,0,0]") then {
  			_houseList = _houseList - [_x];
  	};
  } forEach _houseList;
  diag_log format ["uploadSoldiers.sqf - %1 houses found around side %2 upload point.", count _houseList, _side];

  //spawn AI in houses
  if (count _houseList > 0) then {
    _houseAmount = round (buildingfactor * _amount * ((count _houseList)/_amount));
    diag_log format ["uploadSoldiers.sqf - Spawning %1 units in buildings.", _houseAmount];
    for [{_i = 0}, {_i < _houseAmount}, {_i=_i+1}] do {
      _position = selectRandom ([selectRandom _houselist] call mcd_fnc_getBuildingPositions);
      _units = [selectRandom _availableUnits];
      [_side, _position, _units, false] call _mcd_fnc_spawnULGroup;
      _spawnsLeft = _spawnsLeft - 1;
    };
  };

  //spawn AI in groups outside
  diag_log format ["uploadSoldiers.sqf - Spawning %1 units outside.", _spawnsLeft];
  while {_spawnsLeft > 0} do {
    //get amount
    _groupSize = ceil (random 3);
    if (_groupSize > _spawnsLeft) then {_groupSize = _spawnsLeft};
    _spawnsLeft = _spawnsLeft - _groupSize;
    _units = [];
    for [{_i=0}, {_i<_groupSize}, {_i=_i+1}] do {
      _units pushBack (selectRandom _availableUnits);
    };

    //get position
    _position = [];
    while {str _position == "[]"} do {
      _searchPos = _objective getRelPos [random FRIENDLYAIRADIUS, random 360];
      _position = _searchPos findEmptyPosition [0,10];
    };

    //spawn units
    _patrol = (random 1) > 0.2;
    [_side, _position, _units, _patrol] call _mcd_fnc_spawnULGroup;
  };
} forEach (BIS_hvt_pickupInfo select 4);
