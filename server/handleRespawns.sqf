/*  handles player respawns and game phases
*
*   executed via init.sqf on server
*/

//initial definition of variables
WAVERESPAWNBLU = false;
publicVariable "WAVERESPAWNBLU";
WAVERESPAWNOPF = false;
publicVariable "WAVERESPAWNOPF";
WAVERESPAWNPLAYERSLEFTBLU = RESPAWNWAVESIZE;
publicVariable "WAVERESPAWNPLAYERSLEFTBLU";
WAVERESPAWNPLAYERSLEFTOPF = RESPAWNWAVESIZE;
publicVariable "WAVERESPAWNPLAYERSLEFTOPF";
WAVERESPAWNTIMELEFTBLU = WAVERESPAWNTIME;
publicVariable "WAVERESPAWNTIMELEFTBLU";
WAVERESPAWNTIMELEFTOPF = WAVERESPAWNTIME;
publicVariable "WAVERESPAWNTIMELEFTOPF";
FOBESTBLU = false;
publicVariable "FOBESTBLU";
FOBESTOPF = false;
publicVariable "FOBESTOPF";
SCHEMATICSVISIBLE = false;
publicVariable "SCHEMATICSVISIBLE";
GAMEPHASE = 1;
publicVariable "GAMEPHASE";
FOBFREERESPAWNBLU = false;
publicVariable "FOBFREERESPAWNBLU";
FOBFREERESPAWNOPF = false;
publicVariable "FOBFREERESPAWNOPF";

deadPlayersBlu = [];
deadPlayersOpf = [];
newBluSpawns = [];
newOpfSpawns = [];

//FUNCTIONS ====================================================================
mcd_fnc_freeRespawnBlu = {
  FOBFREERESPAWNBLU = true;
  publicVariable "FOBFREERESPAWNBLU";
  WAVERESPAWNBLU = true;
  publicVariable "WAVERESPAWNBLU";
  sleep 8;
  WAVERESPAWNBLU = false;
  publicVariable "WAVERESPAWNBLU";
  FOBFREERESPAWNBLU = false;
  publicVariable "FOBFREERESPAWNBLU";
  WAVERESPAWNTIMELEFTBLU = 0;
  sleep 2;
  WAVERESPAWNTIMELEFTBLU = WAVERESPAWNTIME;
  publicVariable "WAVERESPAWNTIMELEFTBLU";
};

mcd_fnc_freeRespawnOpf = {
  FOBFREERESPAWNOPF = true;
  publicVariable "FOBFREERESPAWNOPF";
  WAVERESPAWNOPF = true;
  publicVariable "WAVERESPAWNOPF";
  sleep 8;
  WAVERESPAWNOPF = false;
  publicVariable "WAVERESPAWNOPF";
  FOBFREERESPAWNOPF = false;
  publicVariable "FOBFREERESPAWNOPF";
  WAVERESPAWNTIMELEFTOPF = 0;
  sleep 2;
  WAVERESPAWNTIMELEFTOPF = WAVERESPAWNTIME;
  publicVariable "WAVERESPAWNTIMELEFTOPF";
};

mcd_fnc_waveTimeLeftBlu = {
  while {WAVERESPAWNTIMELEFTBLU > 0} do {
    WAVERESPAWNTIMELEFTBLU = WAVERESPAWNTIMELEFTBLU - 1;
    publicVariable "WAVERESPAWNTIMELEFTBLU";
    sleep 1;
  };
};

mcd_fnc_waveTimeLeftOpf = {
  while {WAVERESPAWNTIMELEFTOPF > 0} do {
    WAVERESPAWNTIMELEFTOPF = WAVERESPAWNTIMELEFTOPF - 1;
    publicVariable "WAVERESPAWNTIMELEFTOPF";
    sleep 1;
  };
};

//CHECK FOB STATUS =============================================================
//BLUFOR
[] spawn {
  while {!FOBESTBLU} do {
    if ((["GetStageSide", [WEST]] call BIS_fnc_moduleHvtObjectivesInstance) == 1) then {
      "respawn_west" setMarkerPos getPos moduleFobBlu;
      FOBESTBLU = true;
      publicVariable "FOBESTBLU";
      sleep 2;  //wait until new marker pos is synchronized
      [] spawn mcd_fnc_freeRespawnBlu;
    };
    sleep 2;
  };
};

//OPFOR
[] spawn {
  while {!FOBESTOPF} do {
    if ((["GetStageSide", [EAST]] call BIS_fnc_moduleHvtObjectivesInstance) == 1) then {
      "respawn_east" setMarkerPos getPos moduleFobOpf;
      FOBESTOPF = true;
      publicVariable "FOBESTOPF";
      sleep 2;  //wait until new marker pos is synchronized
      [] spawn mcd_fnc_freeRespawnOpf;
    };
    sleep 2;
  };
};

//UPDATE GAMEPHASES ============================================================
[] spawn {

  //update phase 1-->2
  while {GAMEPHASE == 1} do {
    //update gamephase if both teams have established FOBs
    if (FOBESTBLU && FOBESTOPF) then {
      GAMEPHASE = 2;
      publicVariable "GAMEPHASE";
      diag_log "Gamephase 2 has started";
    };
    sleep 2;
  };

  //update phase 2-->3
  while {GAMEPHASE == 2} do {
    if (BIS_moduleHvtObjectivesInstance_endGameObjective getVariable "bis_modulehvtobjective_visible") then {
      SCHEMATICSVISIBLE = true;
      publicVariable "SCHEMATICSVISIBLE";

      [] spawn mcd_fnc_freeRespawnBlu;
      [] spawn mcd_fnc_freeRespawnOpf;

      sleep 15;

      GAMEPHASE = 3;
      publicVariable "GAMEPHASE";
      diag_log "Gamephase 3 has started";
    };
    sleep 2;
  };
};

//WAVE RESPAWN BLU =============================================================
[] spawn {

  while {GAMEPHASE < 3} do {

    waitUntil {!WAVERESPAWNBLU};

    //start wave timer
    if (count deadPlayersBlu >= 1 && WAVERESPAWNTIMELEFTBLU == WAVERESPAWNTIME) then {
      [] spawn mcd_fnc_waveTimeLeftBlu;
    };

    //check current dead players
    if (count deadPlayersBlu >= RESPAWNWAVESIZE && WAVERESPAWNTIMELEFTBLU <= 0) then {
      newBluSpawns = [];
      WAVERESPAWNBLU = true;
      publicVariable "WAVERESPAWNBLU";
      diag_log "handleRespawns.sqf - Respawning now possible for Blufor.";

      sleep (RESPAWNWAVEEXTRATIME max 7);

      WAVERESPAWNBLU = false;
      publicVariable "WAVERESPAWNBLU";
      WAVERESPAWNTIMELEFTBLU = WAVERESPAWNTIME;
      publicVariable  "WAVERESPAWNTIMELEFTBLU";
      diag_log "handleRespawns.sqf - Respawning no longer possible for Blufor.";
      newBluSpawns = [];

      sleep 3;
    };

    sleep 2;
  };
};

//WAVE RESPAWN OPF =============================================================
[] spawn {

  while {GAMEPHASE < 3} do {

    waitUntil {!WAVERESPAWNOPF};

    //start wave timer
    if (count deadPlayersOpf >= 1 && WAVERESPAWNTIMELEFTOPF == WAVERESPAWNTIME) then {
      [] spawn mcd_fnc_waveTimeLeftOpf;
    };

    //check current dead players
    if (count deadPlayersOpf >= RESPAWNWAVESIZE && WAVERESPAWNTIMELEFTOPF <= 0) then {
      newOpfSpawns = [];
      WAVERESPAWNOPF = true;
      publicVariable "WAVERESPAWNOPF";
      diag_log "handleRespawns.sqf - Respawning now possible for Opfor.";

      sleep (RESPAWNWAVEEXTRATIME max 7);

      WAVERESPAWNOPF = false;
      publicVariable "WAVERESPAWNOPF";
      WAVERESPAWNTIMELEFTOPF = WAVERESPAWNTIME;
      publicVariable "WAVERESPAWNTIMELEFTOPF";
      diag_log "handleRespawns.sqf - Respawning no longer possible for Opfor.";
      newOpfSpawns = [];

      sleep 3;
      /*["EAST"] call mcd_fnc_handleRespawned;*/
    };

    sleep 2;
  };
};
