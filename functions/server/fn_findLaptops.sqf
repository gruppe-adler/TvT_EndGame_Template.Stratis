//find laptops
_newLaptops = [];
_i = 1;
_notFoundCount = 0;

while {!_allFound} do {
  _vehicleVar = "obj_download_" + (str _i);
  if (!isNil _vehicleVar) then {
    _notFoundCount = 0;
    _vehicleVar = call compile _vehicleVar;
    _type = typeOf _vehicleVar;
    if (_type == "Land_Laptop_unfolded_F" || _type == "Land_Laptop_device_F" || _type == "Land_Laptop_F") then {
      _laptops pushBack _vehicleVar;
    };
  } else {
    _notFoundCount = _notFoundCount + 1;
    if (_notFoundCount >= 20) then {
      diag_log format ["findLaptops.sqf - No further laptops found. %1 found total.", count _laptops];
      _allFound = true;
    };
  };
  _i = _i + 1;
};

_newLaptops
