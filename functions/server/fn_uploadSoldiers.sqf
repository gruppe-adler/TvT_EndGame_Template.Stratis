/*  Spawns friendly AI at upload position for each team
*
*   executed via init.sqf on server
*/

if (isNil "FRIENDLYUPLOADAI") then {FRIENDLYUPLOADAI = false};
if !(FRIENDLYUPLOADAI) exitWith {};

[{GAMEPHASE == 3},{

    private ["_amount"];
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
      _newGroup setBehaviour 'SAFE';
      _newGroup setSpeedMode 'NORMAL';
      if ((count _unitTypes) == 0) exitWith {};
          _return = [];
      {
        _spawnPos = _groupPos findEmptyPosition [0,(ceil(FRIENDLYAIRADIUS/2))];
        if (str _spawnPos isEqualTo []) then {_spawnPos = _groupPos};
        _newUnit = _newGroup createUnit [_x, _spawnPos, [], 0, 'NONE'];
        [_newUnit] call GRAD_Loadout_fnc_doLoadoutForUnit;
        _newUnit setVariable ["GRAD_replay_persistentName", name _newUnit, true];
        _return pushBack _newUnit;
      } forEach _unitTypes;
      _return
    };

    //spawn units ==================================================================
    {
        _objective = _x;

        //get side of objective
        _side = _objective getvariable "BIS_hvt_downloadableOwnerSide";
        _unitTypes = [];
        _groupSize = (ceil (random (_amount/3)))max 2;
        for [{_i=0}, {_i<_groupSize}, {_i=_i+1}] do {
            _type = format ["%1_%2", if (_side == WEST) then {"B"}else{"O"},selectRandom ["Soldier_A_F","Soldier_AAR_F","Soldier_AR_F","Medic_F","Soldier_GL_F","Soldier_M_F","Soldier_F","Soldier_TL_F","Soldier_SL_F"]];
            _unitTypes pushBack _type;
        };

        diag_log format ["uploadSoldiers.sqf - Upload objective %1 belongs to side %2.", _objective, _side];

        //create Units
        _pos = (getPos _objective);
        _units = [];
        for [{_l=0}, {_l<(ceil(_amount/_groupSize))}, {_l=_l+1}] do {
                _returnedUnits = [_side, _pos, _unitTypes] call _spawnGroup;
                _units append _returnedUnits;
        };

        _unitsLeft = [_pos, ["Building"], _units, (ceil(FRIENDLYAIRADIUS/2)), 1, true, true] call ace_ai_fnc_garrison;
        diag_log format ["uploadSoldiers.sqf - Garisoned %1 AI.", (_amount - (count _unitsLeft))];

        if ((count _unitsLeft) >= 0) then {
            _groups = [];
            {
                _groups pushBackUnique (group _x);
            }forEach _unitsLeft;

            {
                    [_x, getPos (leader _x), FRIENDLYAIRADIUS, (round random 5) max 2, "MOVE", "SAFE", "YELLOW", "LIMITED"] call CBA_fnc_taskPatrol;
            }forEach _groups;

        };
    } forEach (BIS_hvt_pickupInfo select 4);
},[]] call CBA_fnc_waitUntilAndExecute;
