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

//CHECK FOB STATUS =============================================================
//BLUFOR
[] spawn {
  /*fsmIdFobBlu = moduleFobBlu getVariable "bis_modulehvtobjective_fsm";*/

  while {!fobEstBlu} do {
    if ((["GetStageSide", [WEST]] call BIS_fnc_moduleHvtObjectivesInstance) == 1) then {
      "respawn_west" setMarkerPos getPos moduleFobBlu;
      fobEstBlu = true;
      publicVariable "fobEstBlu";
      sleep 2;  //wait until new marker pos is synchronized
      FOBFREERESPAWNBLU = true;
      publicVariable "FOBFREERESPAWNBLU";
    };
    sleep 2;
  };
};

//OPFOR
[] spawn {
  /*fsmIdFobOpf = moduleFobOpf getVariable "bis_modulehvtobjective_fsm";*/

  while {!fobEstOpf} do {
    if ((["GetStageSide", [EAST]] call BIS_fnc_moduleHvtObjectivesInstance) == 1) then {
      "respawn_east" setMarkerPos getPos moduleFobOpf;
      fobEstOpf = true;
      publicVariable "fobEstOpf";
      sleep 2;  //wait until new marker pos is synchronized
      FOBFREERESPAWNOPF = true;
      publicVariable "FOBFREERESPAWNOPF";
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

    //respawn without wave if team just captured the first FOB
    if (FOBFREERESPAWNBLU) then {
      WAVERESPAWNBLU = true;
      publicVariable "WAVERESPAWNBLU";
      sleep RESPAWNTIME + 10;
      WAVERESPAWNBLU = false;
      publicVariable "WAVERESPAWNBLU";
      FOBFREERESPAWNBLU = false;
      publicVariable "FOBFREERESPAWNBLU";
      /*["WEST"] call mcd_fnc_removeRespawnedFromList;*/
    };

    //check current dead players
    if (count deadPlayersBlu >= RESPAWNWAVESIZE) then {
      WAVERESPAWNBLU = true;
      publicVariable "WAVERESPAWNBLU";
      diag_log format ["handleRespawns.sqf - %1 players in Blufor wave. Respawning now possible.", count deadPlayersBlu];

      sleep RESPAWNWAVEEXTRATIME;

      WAVERESPAWNBLU = false;
      publicVariable "WAVERESPAWNBLU";
      diag_log format ["handleRespawns.sqf - Respawning no longer possible for Blufor."];

      /*["WEST"] call mcd_fnc_removeRespawnedFromList;*/
    };

    sleep 2;
  };
};

//WAVE RESPAWN OPF =============================================================
[] spawn {

  while {GAMEPHASE < 3} do {

    //respawn without wave if team just captured the first FOB
    if (FOBFREERESPAWNOPF) then {
      WAVERESPAWNOPF = true;
      publicVariable "WAVERESPAWNOPF";
      sleep RESPAWNTIME + 10;
      WAVERESPAWNOPF = false;
      publicVariable "WAVERESPAWNOPF";
      FOBFREERESPAWNOPF = false;
      publicVariable "FOBFREERESPAWNOPF";
      /*["EAST"] call mcd_fnc_removeRespawnedFromList;*/
    };

    //check current dead players
    if (count deadPlayersOpf >= RESPAWNWAVESIZE) then {
      WAVERESPAWNOPF = true;
      publicVariable "WAVERESPAWNOPF";
      diag_log format ["handleRespawns.sqf - %1 players in Opfor wave. Respawning now possible.", count deadPlayersOpf];

      sleep RESPAWNWAVEEXTRATIME;

      WAVERESPAWNOPF = false;
      publicVariable "WAVERESPAWNOPF";
      diag_log format ["handleRespawns.sqf - Respawning no longer possible for Opfor."];

      /*["EAST"] call mcd_fnc_removeRespawnedFromList;*/
    };

    sleep 2;
  };
};
