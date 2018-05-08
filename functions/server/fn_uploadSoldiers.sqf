/*  Spawns friendly AI at upload position for each team
*
*   executed via init.sqf on server
*/

if (isNil "FRIENDLYUPLOADAI") then {FRIENDLYUPLOADAI = false};
if !(FRIENDLYUPLOADAI) exitWith {};

[{SCHEMATICSVISIBLE},{

    private ["_amount"];
    _types = ["Soldier_A_F","soldier_AAR_F","soldier_AR_F","medic_F","Soldier_GL_F","soldier_M_F","Soldier_F","soldier_LAT_F","soldier_LAT2_F","Soldier_TL_F","Soldier_SL_F"];
    _amount = FRIENDLYAIAMOUNT;
    //get amount ===================================================================
    if (typeName FRIENDLYAIAMOUNT == "ARRAY") then {
      _amount = (FRIENDLYAIAMOUNT select 0) + (random ((FRIENDLYAIAMOUNT select 1) - (FRIENDLYAIAMOUNT select 0)));
      _amount = round _amount;
    };
    diag_log format ["uploadSoldiers.sqf - Spawning %1 AI per side in a radius of %2.", _amount, FRIENDLYAIRADIUS];

    //spawn function ===============================================================
    _spawnGroup = {
      params ["_side", "_groupPos", "_unitTypes"];
      _newGroup = createGroup _side;
      _newGroup setFormation 'WEDGE';
      _newGroup setCombatMode 'YELLOW';
      _newGroup setBehaviour 'AWARE';
      _newGroup setSpeedMode 'NORMAL';
      if ((count _unitTypes) == 0) exitWith {};
          _units = [];
      {
        _spawnPos = _groupPos findEmptyPosition [0,10];
        if (str _spawnPos isEqualTo []) then {_spawnPos = _groupPos};
        _newUnit = _newGroup createUnit [_x, _spawnPos, [], 0, 'CAN_COLLIDE'];
        _units pushBack _newUnit;
      } forEach _unitTypes;
      _units
    };

    //spawn units ==================================================================
    {
        _objective = _x;

        //get side of objective
        _side = _objective getvariable "BIS_hvt_downloadableOwnerSide";

        for [{_i=0}, {_i<_groupSize}, {_i=_i+1}] do {
            _type = format ["%1_%2", if (_side == WEST) then {"B"}else{"O"},selectRandom _types];
            _unitTypes pushBack _type;
        };

      diag_log format ["uploadSoldiers.sqf - Upload objective %1 belongs to side %2.", _objective, _side];

        //get amount
        _groupSize = ceil (random 5);
        _pos = (getPos _objective);
        _units = [];
        for [{_l=0}, {_l<(ceil(_amount/_groupSize))}, {_l=_l+1}] do {
            for [{_i=0}, {_i<_groupSize}, {_i=_i+1}] do {
                _returnedUnits = [_side, _pos, _unitTypes] call _spawnGroup;
                _units append _returnedUnits;
            };
        };

        _unitsLeft = [_pos, nil, _units, FRIENDLYAIRADIUS, 1, true, true] call ace_ai_fnc_garrison;

        if ((count _unitsLeft) >= 0) then {
            _groups = [];
            {
                _groups pushBackUnique (group _x);
            }forEach _unitsLeft;

            {
                        [_x, getPos (leader _x), 50, (round random 5) max 2, "MOVE", "SAFE", "YELLOW", "LIMITED"] call CBA_fnc_taskPatrol;
            }forEach _groups;

        };
    } forEach (BIS_hvt_pickupInfo select 4);
},[]] call CBA_fnc_waitUntilAndExecute;
