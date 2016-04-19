/*  Fills containers with items
*
*   executed on server via init.sqf
*/

#include "USERSCRIPTS\fillContainers.sqf";

_objVehicles = [];

//find containers
_allFound = false;
_i = 1;
_counter = 0;
_notFoundCount = 0;
while {!_allFound} do {
  _vehicleVar = "fillcontainer_" + (str _i);
  if (!isNil _vehicleVar) then {
    _notFoundCount = 0;
    _vehicleVar = call compile _vehicleVar;
    _objVehicles pushBack _vehicleVar;
    _counter = _counter + 1;
  } else {
    _notFoundCount = _notFoundCount + 1;
    if (_notFoundCount >= 10) then {
      diag_log format ["fillContainerInit.sqf - No further containers found. %1 found total.", _counter];
      _allFound = true;
    };
  };
  _i = _i + 1;
};

//find slingloadobjects that want to be filled
_allFound = false;
_i = 1;
_counter = 0;
_notFoundCount = 0;
while {!_allFound} do {
  _vehicleVar = "fillslingloadobject_" + (str _i);
  if (!isNil _vehicleVar) then {
    _notFoundCount = 0;
    _vehicleVar = call compile _vehicleVar;
    _objVehicles pushBack _vehicleVar;
    _counter = _counter + 1;
  } else {
    _notFoundCount = _notFoundCount + 1;
    if (_notFoundCount >= 10) then {
      diag_log format ["fillContainerInit.sqf - No further fillable slingloadobjects found. %1 found total.", _counter];
      _allFound = true;
    };
  };
  _i = _i + 1;
};

//fill containers
{
  clearWeaponCargoGlobal _x;
  clearItemCargoGlobal _x;
  clearMagazineCargoGlobal _x;
  clearBackpackCargoGlobal _x;
  _ammoBox = _x;

  _itemData = call compile ("_" + (str _x));
  {
  	_data = _itemData select _x;
  	if (count _data == 2) then
  	{
  		_names = _data select 0;
  		_counts = _data select 1;
  		if (count _names > 0 && count _counts > 0 && (count _names) == (count _counts)) then
  		{
  			for "_index" from 0 to ((count _names) - 1) do
  			{
  				_currentName = _names select _index;
  				_currentCount = _counts select _index;
  				switch (_x) do
  				{
  					case 4: { _ammoBox addBackpackCargoGlobal [_currentName, _currentCount]; };
  					case 5: { _ammoBox addItemCargoGlobal [_currentName, _currentCount]; };
  					case 6: { _ammoBox addMagazineCargoGlobal [_currentName, _currentCount]; };
  					case 7: { _ammoBox addWeaponCargoGlobal [_currentName, _currentCount]; };
  				};
  			};
  		};
  	};
  } forEach [4,5,6,7];
} forEach _objVehicles;
