/*  handles player respawns and game phases
*   executed via init.sqf on server
*/
#include "../script_component.hpp"

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
      GVARMAIN(FOBESTBLU) = true;
      publicVariable QGVARMAIN(FOBESTBLU);
      //wait until new marker pos is synchronized
      [{
          GVARMAIN(FOBFREERESPAWNBLU) = true;
          publicVariable QGVARMAIN(FOBFREERESPAWNBLU);
          GVARMAIN(WAVERESPAWNBLU) = true;
          publicVariable QGVARMAIN(WAVERESPAWNBLU);

          [{
              GVARMAIN(WAVERESPAWNBLU) = false;
              publicVariable QGVARMAIN(WAVERESPAWNBLU);
              GVARMAIN(FOBFREERESPAWNBLU) = false;
              publicVariable QGVARMAIN(FOBFREERESPAWNBLU);
              GVARMAIN(GVARMAIN(WAVERESPAWNTIME)LEFTBLU) = 0;
          },[],8] call CBA_fnc_waitAndExecute;

          [{
              GVARMAIN(GVARMAIN(WAVERESPAWNTIME)LEFTBLU) = GVARMAIN(WAVERESPAWNTIME);
              publicVariable QGVARMAIN(GVARMAIN(WAVERESPAWNTIME)LEFTBLU);
          },[],10] call CBA_fnc_waitAndExecute;
      },[],2] call CBA_fnc_waitAndExecute;
    };
    if (GVARMAIN(FOBESTBLU)) exitWith {[_this select 1] call CBA_fnc_removePerFrameHandler;};
},2,[]] call CBA_fnc_addPerFrameHandler;

//OPFOR
[{
    if ((["GetStageSide", [EAST]] call BIS_fnc_moduleHvtObjectivesInstance) == 1) then {
      "respawn_east" setMarkerPos getPos moduleFobOpf;
      GVARMAIN(FOBESTOPF) = true;
      publicVariable QGVARMAIN(FOBESTOPF);
      //wait until new marker pos is synchronized
       [{
          GVARMAIN(FOBFREERESPAWNOPF) = true;
          publicVariable QGVARMAIN(FOBFREERESPAWNOPF);
          GVARMAIN(WAVERESPAWNOPF) = true;
          publicVariable QGVARMAIN(WAVERESPAWNOPF);

          [{
              GVARMAIN(WAVERESPAWNOPF) = false;
              publicVariable QGVARMAIN(WAVERESPAWNOPF);
              GVARMAIN(FOBFREERESPAWNOPF) = false;
              publicVariable QGVARMAIN(FOBFREERESPAWNOPF);
              GVARMAIN(GVARMAIN(WAVERESPAWNTIME)LEFTOPF) = 0;
          },[],8] call CBA_fnc_waitAndExecute;

          [{
              GVARMAIN(GVARMAIN(WAVERESPAWNTIME)LEFTOPF) = GVARMAIN(WAVERESPAWNTIME);
              publicVariable QGVARMAIN(GVARMAIN(WAVERESPAWNTIME)LEFTOPF);
          },[],10] call CBA_fnc_waitAndExecute;
          },[],2] call CBA_fnc_waitAndExecute;
    };
    if (GVARMAIN(FOBESTOPF)) exitWith {[_this select 1] call CBA_fnc_removePerFrameHandler;};
},2,[]] call CBA_fnc_addPerFrameHandler;

//UPDATE GVARMAIN(GAMEPHASE)s ============================================================
[{
    //update phase 1-->2
    if(GVARMAIN(GAMEPHASE) == 1) then {
        //update GVARMAIN(GAMEPHASE) if either team has established their FOB
        if (GVARMAIN(FOBESTBLU) || GVARMAIN(FOBESTOPF)) then {
            GVARMAIN(GAMEPHASE) = 2;
            publicVariable QGVARMAIN(GAMEPHASE);
            diag_log "GVARMAIN(GAMEPHASE) 2 has started";
        };
    };

    //update phase 2-->3
    if (GVARMAIN(GAMEPHASE) == 2) then {
        if (BIS_moduleHvtObjectivesInstance_endGameObjective getVariable "bis_modulehvtobjective_visible") then {
            GVARMAIN(SCHEMATICSVISIBLE) = true;
            publicVariable QGVARMAIN(SCHEMATICSVISIBLE);

            GVARMAIN(FOBFREERESPAWNBLU) = true;
            publicVariable QGVARMAIN(FOBFREERESPAWNBLU);
            GVARMAIN(WAVERESPAWNBLU) = true;
            publicVariable QGVARMAIN(WAVERESPAWNBLU);

            [{
                GVARMAIN(WAVERESPAWNBLU) = false;
                publicVariable QGVARMAIN(WAVERESPAWNBLU);
                GVARMAIN(FOBFREERESPAWNBLU) = false;
                publicVariable QGVARMAIN(FOBFREERESPAWNBLU);
                GVARMAIN(GVARMAIN(WAVERESPAWNTIME)LEFTBLU) = 0;
            },[],8] call CBA_fnc_waitAndExecute;

            [{
                GVARMAIN(GVARMAIN(WAVERESPAWNTIME)LEFTBLU) = GVARMAIN(WAVERESPAWNTIME);
                publicVariable QGVARMAIN(GVARMAIN(WAVERESPAWNTIME)LEFTBLU);
            },[],10] call CBA_fnc_waitAndExecute;

            GVARMAIN(FOBFREERESPAWNOPF) = true;
            publicVariable QGVARMAIN(FOBFREERESPAWNOPF);
            GVARMAIN(WAVERESPAWNOPF) = true;
            publicVariable QGVARMAIN(WAVERESPAWNOPF);

            [{
                GVARMAIN(WAVERESPAWNOPF) = false;
                publicVariable QGVARMAIN(WAVERESPAWNOPF);
                GVARMAIN(FOBFREERESPAWNOPF) = false;
                publicVariable QGVARMAIN(FOBFREERESPAWNOPF);
                GVARMAIN(GVARMAIN(WAVERESPAWNTIME)LEFTOPF) = 0;
            },[],8] call CBA_fnc_waitAndExecute;

            [{
                GVARMAIN(GVARMAIN(WAVERESPAWNTIME)LEFTOPF) = GVARMAIN(WAVERESPAWNTIME);
                publicVariable QGVARMAIN(GVARMAIN(WAVERESPAWNTIME)LEFTOPF);
            },[],10] call CBA_fnc_waitAndExecute;

            [{
                GVARMAIN(GAMEPHASE) = 3;
                  publicVariable QGVARMAIN(GAMEPHASE);
                  diag_log "GVARMAIN(GAMEPHASE) 3 has started";
            },[],15] call CBA_fnc_waitAndExecute;
            [_this select 1] call CBA_fnc_removePerFrameHandler;
        };
    };
},1,[]] call CBA_fnc_addPerFrameHandler;

//WAVE RESPAWN BLU =============================================================
[{!GVARMAIN(WAVERESPAWNBLU)},{
    [{
        if (GVARMAIN(GAMEPHASE) <= 3) then {[_this select 1] call CBA_fnc_removePerFrameHandler;};

        //start wave timer
        if ((count deadPlayersBlu >= 1) && (GVARMAIN(GVARMAIN(WAVERESPAWNTIME)LEFTBLU) == GVARMAIN(WAVERESPAWNTIME))) then {
            [{
                if (GVARMAIN(GVARMAIN(WAVERESPAWNTIME)LEFTBLU) < 0) exitWith {[_this select 1] call CBA_fnc_removePerFrameHandler;};
                GVARMAIN(GVARMAIN(WAVERESPAWNTIME)LEFTBLU) = GVARMAIN(GVARMAIN(WAVERESPAWNTIME)LEFTBLU) - 1;
                publicVariable QGVARMAIN(GVARMAIN(WAVERESPAWNTIME)LEFTBLU);
            },1,[]] call CBA_fnc_addPerFrameHandler;
        };

        //check current dead players
        if ((count deadPlayersBlu >= GVARMAIN(RESPAWNWAVESIZE)) && (GVARMAIN(GVARMAIN(WAVERESPAWNTIME)LEFTBLU) <= 0)) then {
            newBluSpawns = [];
            GVARMAIN(WAVERESPAWNBLU) = true;
            publicVariable QGVARMAIN(WAVERESPAWNBLU);
            diag_log "handleRespawns.sqf - Respawning now possible for Blufor.";

             [{
                GVARMAIN(WAVERESPAWNBLU) = false;
                publicVariable QGVARMAIN(WAVERESPAWNBLU);
                GVARMAIN(GVARMAIN(WAVERESPAWNTIME)LEFTBLU) = GVARMAIN(WAVERESPAWNTIME);
                publicVariable  QGVARMAIN(GVARMAIN(WAVERESPAWNTIME)LEFTBLU);
                diag_log "handleRespawns.sqf - Respawning no longer possible for Blufor.";
                newBluSpawns = [];
            },[],(GVARMAIN(RESPAWNWAVEEXTRATIME) max 7)] call CBA_fnc_waitUntilAndExecute;
        };
    },5,[]] call CBA_fnc_addPerFrameHandler;
},[]] call CBA_fnc_waitUntilAndExecute;

//WAVE RESPAWN OPF =============================================================
[{!GVARMAIN(WAVERESPAWNOPF)},{
    [{
        if (GVARMAIN(GAMEPHASE) <= 3) then {[_this select 1] call CBA_fnc_removePerFrameHandler;};

        //start wave timer
        if (count deadPlayersOpf >= 1 && GVARMAIN(GVARMAIN(WAVERESPAWNTIME)LEFTOPF) == GVARMAIN(WAVERESPAWNTIME)) then {
            [{
                if (GVARMAIN(GVARMAIN(WAVERESPAWNTIME)LEFTOPF) < 0) exitWith {[_this select 1] call CBA_fnc_removePerFrameHandler;};
                GVARMAIN(GVARMAIN(WAVERESPAWNTIME)LEFTOPF) = GVARMAIN(GVARMAIN(WAVERESPAWNTIME)LEFTOPF) - 1;
                publicVariable QGVARMAIN(GVARMAIN(WAVERESPAWNTIME)LEFTOPF);
            },1,[]] call CBA_fnc_addPerFrameHandler;
        };

        //check current dead players
        if (((count deadPlayersOpf) >= GVARMAIN(RESPAWNWAVESIZE)) && (GVARMAIN(GVARMAIN(WAVERESPAWNTIME)LEFTOPF) <= 0)) then {
              newOpfSpawns = [];
              GVARMAIN(WAVERESPAWNOPF) = true;
              publicVariable QGVARMAIN(WAVERESPAWNOPF);
              diag_log "handleRespawns.sqf - Respawning now possible for Opfor.";

              [{
                  GVARMAIN(WAVERESPAWNOPF) = false;
                  publicVariable QGVARMAIN(WAVERESPAWNOPF);
                  GVARMAIN(GVARMAIN(WAVERESPAWNTIME)LEFTOPF) = GVARMAIN(WAVERESPAWNTIME);
                  publicVariable QGVARMAIN(GVARMAIN(WAVERESPAWNTIME)LEFTOPF);
                  diag_log "handleRespawns.sqf - Respawning no longer possible for Opfor.";
                  newOpfSpawns = [];
              },[],(GVARMAIN(RESPAWNWAVEEXTRATIME) max 7)] call CBA_fnc_waitUntilAndExecute;
        };
    },5,[]] call CBA_fnc_addPerFrameHandler;
},[]] call CBA_fnc_waitUntilAndExecute;
