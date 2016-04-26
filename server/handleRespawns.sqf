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
fobEstBlu = false;
publicVariable "fobEstBlu";
fobEstOpf = false;
publicVariable "fobEstOpf";
GAMEPHASE = 1;
publicVariable "GAMEPHASE";
FOBFREERESPAWNBLU = false;
publicVariable "FOBFREERESPAWNBLU";
FOBFREERESPAWNOPF = false;
publicVariable "FOBFREERESPAWNOPF";

deadPlayersBlu = [];
deadPlayersOpf = [];

//FREE RESPAWN FUNCTIONS =======================================================
mcd_fnc_freeRespawnBlu = {
  FOBFREERESPAWNBLU = true;
  publicVariable "FOBFREERESPAWNBLU";
  WAVERESPAWNBLU = true;
  publicVariable "WAVERESPAWNBLU";
  sleep 10;
  WAVERESPAWNBLU = false;
  publicVariable "WAVERESPAWNBLU";
  FOBFREERESPAWNBLU = false;
  publicVariable "FOBFREERESPAWNBLU";
};

mcd_fnc_freeRespawnOpf = {
  FOBFREERESPAWNOPF = true;
  publicVariable "FOBFREERESPAWNOPF";
  WAVERESPAWNOPF = true;
  publicVariable "WAVERESPAWNOPF";
  sleep 10;
  WAVERESPAWNOPF = false;
  publicVariable "WAVERESPAWNOPF";
  FOBFREERESPAWNOPF = false;
  publicVariable "FOBFREERESPAWNOPF";
};

//CHECK FOB STATUS =============================================================
//BLUFOR
[] spawn {
  while {!fobEstBlu} do {
    if ((["GetStageSide", [WEST]] call BIS_fnc_moduleHvtObjectivesInstance) == 1) then {
      "respawn_west" setMarkerPos getPos moduleFobBlu;
      fobEstBlu = true;
      publicVariable "fobEstBlu";
      sleep 2;  //wait until new marker pos is synchronized
      [] spawn mcd_fnc_freeRespawnBlu;
    };
    sleep 2;
  };
};

//OPFOR
[] spawn {
  while {!fobEstOpf} do {
    if ((["GetStageSide", [EAST]] call BIS_fnc_moduleHvtObjectivesInstance) == 1) then {
      "respawn_east" setMarkerPos getPos moduleFobOpf;
      fobEstOpf = true;
      publicVariable "fobEstOpf";
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
    if (fobEstBlu && fobEstOpf) then {
      GAMEPHASE = 2;
      publicVariable "GAMEPHASE";
      diag_log "Gamephase 2 has started";
    };
    sleep 2;
  };

  //update phase 2-->3
  while {GAMEPHASE == 2} do {
    if (moduleEndGame getVariable "bis_modulehvtobjective_visible") then {

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

    //check current dead players
    if (count deadPlayersBlu >= RESPAWNWAVESIZE) then {

      diag_log format ["handleRespawns.sqf - %1 players in Blufor wave. Respawning possible in %2s.", count deadPlayersBlu, WAVERESPAWNTIME];
      while {WAVERESPAWNTIMELEFTBLU > 0} do {
        WAVERESPAWNTIMELEFTBLU = WAVERESPAWNTIMELEFTBLU - 1;
        publicVariable "WAVERESPAWNTIMELEFTBLU";
        sleep 1;
      };

      WAVERESPAWNBLU = true;
      publicVariable "WAVERESPAWNBLU";
      diag_log "handleRespawns.sqf - Respawning now possible for Blufor.";

      sleep (RESPAWNWAVEEXTRATIME max 7);

      WAVERESPAWNBLU = false;
      publicVariable "WAVERESPAWNBLU";
      WAVERESPAWNTIMELEFTBLU = WAVERESPAWNTIME;
      publicVariable  "WAVERESPAWNTIMELEFTBLU";
      diag_log "handleRespawns.sqf - Respawning no longer possible for Blufor.";
    };

    sleep 2;
  };
};

//WAVE RESPAWN OPF =============================================================
[] spawn {

  while {GAMEPHASE < 3} do {

    waitUntil {!WAVERESPAWNOPF};

    //check current dead players
    if (count deadPlayersOpf >= RESPAWNWAVESIZE) then {

      diag_log format ["handleRespawns.sqf - %1 players in Opfor wave. Respawning possible in %2s.", count deadPlayersOpf, WAVERESPAWNTIME];
      while {WAVERESPAWNTIMELEFTOPF > 0} do {
        WAVERESPAWNTIMELEFTOPF = WAVERESPAWNTIMELEFTOPF - 1;
        publicVariable "WAVERESPAWNTIMELEFTOPF";
        sleep 1;
      };

      WAVERESPAWNOPF = true;
      publicVariable "WAVERESPAWNOPF";
      diag_log "handleRespawns.sqf - Respawning now possible for Opfor.";

      sleep (RESPAWNWAVEEXTRATIME max 7);

      WAVERESPAWNOPF = false;
      publicVariable "WAVERESPAWNOPF";
      WAVERESPAWNTIMELEFTOPF = WAVERESPAWNTIME;
      publicVariable "WAVERESPAWNTIMELEFTOPF";
      diag_log "handleRespawns.sqf - Respawning no longer possible for Opfor.";

      /*["EAST"] call mcd_fnc_removeRespawnedFromList;*/
    };

    sleep 2;
  };
};
