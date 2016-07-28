/*  Gets all positions in a building
*
*   Params:
*   0:  building
*/

params ["_building"];
private ["_buildingPos"];

_i = 0;
_allPositions = [];
while {_buildingPos = _building buildingpos _i; (str _buildingPos) != "[0,0,0]"} do {
  _allPositions pushBack _buildingPos;
  _i = _i + 1;
};

_allPositions
