/*  handles player respawns and game phases
*   executed via init.sqf on server
*/

//initial definition of variables
deadPlayersBlu = [];
deadPlayersOpf = [];
newBluSpawns = [];
newOpfSpawns = [];

//CHECK FOB STATUS =============================================================
//BLUFOR
[{
    if ((["GetStageSide", [WEST]] call BIS_fnc_moduleHvtObjectivesInstance) == 1) then {
      "respawn_west" setMarkerPos getPos moduleFobBlu;
      FOBESTBLU = true;
      publicVariable "FOBESTBLU";
      //wait until new marker pos is synchronized
      [{
          FOBFREERESPAWNBLU = true;
          publicVariable "FOBFREERESPAWNBLU";
          WAVERESPAWNBLU = true;
          publicVariable "WAVERESPAWNBLU";

          [{
              WAVERESPAWNBLU = false;
              publicVariable "WAVERESPAWNBLU";
              FOBFREERESPAWNBLU = false;
              publicVariable "FOBFREERESPAWNBLU";
              WAVERESPAWNTIMELEFTBLU = 0;
          },[],8] call CBA_fnc_waitAndExecute;

          [{
              WAVERESPAWNTIMELEFTBLU = WAVERESPAWNTIME;
              publicVariable "WAVERESPAWNTIMELEFTBLU";
          },[],10] call CBA_fnc_waitAndExecute;
      },[],2] call CBA_fnc_waitAndExecute;
    };
    if (FOBESTBLU) exitWith {[_this select 1] call CBA_fnc_removePerFrameHandler;};
},2,[]] call CBA_fnc_addPerFrameHandler;

//OPFOR
[{
    if ((["GetStageSide", [EAST]] call BIS_fnc_moduleHvtObjectivesInstance) == 1) then {
      "respawn_east" setMarkerPos getPos moduleFobOpf;
      FOBESTOPF = true;
      publicVariable "FOBESTOPF";
      //wait until new marker pos is synchronized
       [{
          FOBFREERESPAWNOPF = true;
          publicVariable "FOBFREERESPAWNOPF";
          WAVERESPAWNOPF = true;
          publicVariable "WAVERESPAWNOPF";

          [{
              WAVERESPAWNOPF = false;
              publicVariable "WAVERESPAWNOPF";
              FOBFREERESPAWNOPF = false;
              publicVariable "FOBFREERESPAWNOPF";
              WAVERESPAWNTIMELEFTOPF = 0;
          },[],8] call CBA_fnc_waitAndExecute;

          [{
              WAVERESPAWNTIMELEFTOPF = WAVERESPAWNTIME;
              publicVariable "WAVERESPAWNTIMELEFTOPF";
          },[],10] call CBA_fnc_waitAndExecute;
          },[],2] call CBA_fnc_waitAndExecute;
    };
    if (FOBESTOPF) exitWith {[_this select 1] call CBA_fnc_removePerFrameHandler;};
},2,[]] call CBA_fnc_addPerFrameHandler;

//UPDATE GAMEPHASES ============================================================
[{
    //update phase 1-->2
    if(GAMEPHASE == 1) then {
        //update gamephase if either team has established their FOB
        if (FOBESTBLU || FOBESTOPF) then {
            GAMEPHASE = 2;
            publicVariable "GAMEPHASE";
            diag_log "Gamephase 2 has started";
        };
    };

    //update phase 2-->3
    if (GAMEPHASE == 2) then {
        if (BIS_moduleHvtObjectivesInstance_endGameObjective getVariable "bis_modulehvtobjective_visible") then {
            SCHEMATICSVISIBLE = true;
            publicVariable "SCHEMATICSVISIBLE";

            FOBFREERESPAWNBLU = true;
            publicVariable "FOBFREERESPAWNBLU";
            WAVERESPAWNBLU = true;
            publicVariable "WAVERESPAWNBLU";

            [{
                WAVERESPAWNBLU = false;
                publicVariable "WAVERESPAWNBLU";
                FOBFREERESPAWNBLU = false;
                publicVariable "FOBFREERESPAWNBLU";
                WAVERESPAWNTIMELEFTBLU = 0;
            },[],8] call CBA_fnc_waitAndExecute;

            [{
                WAVERESPAWNTIMELEFTBLU = WAVERESPAWNTIME;
                publicVariable "WAVERESPAWNTIMELEFTBLU";
            },[],10] call CBA_fnc_waitAndExecute;

            FOBFREERESPAWNOPF = true;
            publicVariable "FOBFREERESPAWNOPF";
            WAVERESPAWNOPF = true;
            publicVariable "WAVERESPAWNOPF";

            [{
                WAVERESPAWNOPF = false;
                publicVariable "WAVERESPAWNOPF";
                FOBFREERESPAWNOPF = false;
                publicVariable "FOBFREERESPAWNOPF";
                WAVERESPAWNTIMELEFTOPF = 0;
            },[],8] call CBA_fnc_waitAndExecute;

            [{
                WAVERESPAWNTIMELEFTOPF = WAVERESPAWNTIME;
                publicVariable "WAVERESPAWNTIMELEFTOPF";
            },[],10] call CBA_fnc_waitAndExecute;

            [{
                GAMEPHASE = 3;
                  publicVariable "GAMEPHASE";
                  diag_log "Gamephase 3 has started";
            },[],15] call CBA_fnc_waitAndExecute;
            [_this select 1] call CBA_fnc_removePerFrameHandler;
        };
    };
},1,[]] call CBA_fnc_addPerFrameHandler;

//WAVE RESPAWN BLU =============================================================
[{!WAVERESPAWNBLU},{
    [{
        if (GAMEPHASE < 3) then {[_this select 1] call CBA_fnc_removePerFrameHandler;};

        //start wave timer
        if ((count deadPlayersBlu >= 1) && (WAVERESPAWNTIMELEFTBLU == WAVERESPAWNTIME)) then {
            [{
                if (WAVERESPAWNTIMELEFTBLU > 0) exitWith {[_this select 1] call CBA_fnc_removePerFrameHandler;};
                WAVERESPAWNTIMELEFTBLU = WAVERESPAWNTIMELEFTBLU - 1;
                publicVariable "WAVERESPAWNTIMELEFTBLU";
            },1,[]] call CBA_fnc_addPerFrameHandler;
            };

              //check current dead players
              if ((count deadPlayersBlu >= RESPAWNWAVESIZE) && (WAVERESPAWNTIMELEFTBLU <= 0)) then {
                  newBluSpawns = [];
                  WAVERESPAWNBLU = true;
                  publicVariable "WAVERESPAWNBLU";
                  diag_log "handleRespawns.sqf - Respawning now possible for Blufor.";

                  [{
                      WAVERESPAWNBLU = false;
                      publicVariable "WAVERESPAWNBLU";
                      WAVERESPAWNTIMELEFTBLU = WAVERESPAWNTIME;
                      publicVariable  "WAVERESPAWNTIMELEFTBLU";
                      diag_log "handleRespawns.sqf - Respawning no longer possible for Blufor.";
                      newBluSpawns = [];
                  },[],(RESPAWNWAVEEXTRATIME max 7)] call CBA_fnc_waitUntilAndExecute;
              };
    },5,[]] call CBA_fnc_addPerFrameHandler;
},[]] call CBA_fnc_waitUntilAndExecute;

//WAVE RESPAWN OPF =============================================================
[{!WAVERESPAWNOPF},{
    [{
        if (GAMEPHASE < 3) then {[_this select 1] call CBA_fnc_removePerFrameHandler;};

        //start wave timer
        if (count deadPlayersOpf >= 1 && WAVERESPAWNTIMELEFTOPF == WAVERESPAWNTIME) then {
            [{
                if (WAVERESPAWNTIMELEFTOPF > 0) exitWith {[_this select 1] call CBA_fnc_removePerFrameHandler;};
                WAVERESPAWNTIMELEFTOPF = WAVERESPAWNTIMELEFTOPF - 1;
                publicVariable "WAVERESPAWNTIMELEFTOPF";
            },1,[]] call CBA_fnc_addPerFrameHandler;
        };

        //check current dead players
        if (count deadPlayersOpf >= RESPAWNWAVESIZE && WAVERESPAWNTIMELEFTOPF <= 0) then {
              newOpfSpawns = [];
              WAVERESPAWNOPF = true;
              publicVariable "WAVERESPAWNOPF";
              diag_log "handleRespawns.sqf - Respawning now possible for Opfor.";

              [{
                  WAVERESPAWNOPF = false;
                  publicVariable "WAVERESPAWNOPF";
                  WAVERESPAWNTIMELEFTOPF = WAVERESPAWNTIME;
                  publicVariable "WAVERESPAWNTIMELEFTOPF";
                  diag_log "handleRespawns.sqf - Respawning no longer possible for Opfor.";
                  newOpfSpawns = [];
              },[],(RESPAWNWAVEEXTRATIME max 7)] call CBA_fnc_waitUntilAndExecute;
        };
    },5,[]] call CBA_fnc_addPerFrameHandler;
},[]] call CBA_fnc_waitUntilAndExecute;
