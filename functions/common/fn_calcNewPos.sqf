params ["_initialPos", "_flyToPos"];
_initialPos params ["_initX", "_initY"];
_flyToPos param ["_flyToX", "_flyToY", "_flyToZ"];

//calculate the x and y differentce
_dX = _flyToX - _initX;
_dY = _flyToY - _initY;

//get angle between markers and add 180
_ang = _dX atan2 _dY;
_ang = _ang + 180;

//fix angle if <0 or >360
_ang = _ang mod 360;

//find new coords
_newX = _initX + sin(_ang)*(_dX/2);
_newY = _initY + cos(_ang)*(_dY/2);

_newcoords = [ _newX, _newY, (_flyToZ + 100)];

_newcoords
