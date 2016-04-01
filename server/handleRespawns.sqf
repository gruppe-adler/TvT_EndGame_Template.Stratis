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

fobFreeRespawnBlu = false;
fobFreeRespawnOpf = false;

deadPlayersBlu = [];
deadPlayersOpf = [];

//UPDATE GAMEPHASES ============================================================
[] spawn {

  //find FSM IDs of both starting objectives
  fsmIdFobBlu = moduleFobBlu getVariable "bis_modulehvtobjective_fsm";
  fsmIdFobOpf = moduleFobOpf getVariable "bis_modulehvtobjective_fsm";

  //update phase 1-->2
  while {GAMEPHASE == 1} do {

    //is Blufor FOB established?
    if (completedFSM fsmIdFobBlu) then {
      //if first detection do:
      if (!fobEstBlu) then {
        "respawn_west" setMarkerPos getPos moduleFobBlu;
        fobEstBlu = true;
        publicVariable "fobEstBlu";
        fobFreeRespawnBlu = true;
      };
    };

    //is Opfor FOB established?
    if (completedFSM fsmIdFobOpf) then {
      //if first detection do:
      if (!fobEstOpf) then {
        "respawn_east" setMarkerPos getPos moduleFobOpf;
        fobEstOpf = true;
        publicVariable "fobEstOpf";
        fobFreeRespawnOpf = true;
      };
    };

    //update gamephase if both teams have established FOBs
    if (fobEstBlu && fobEstOpf) then {
      GAMEPHASE = 2;
      publicVariable "GAMEPHASE";
      diag_log "Gamephase 2 has started";
    };
    sleep 3;
  };

  //update phase 2-->3
  while {GAMEPHASE == 2} do {
    if (moduleEndGame getVariable "bis_modulehvtobjective_visible") then {
      GAMEPHASE = 3;
      publicVariable "GAMEPHASE";
      diag_log "Gamephase 3 has started";
    };
    sleep 3;
  };
};

//WAVE RESPAWN BLU =============================================================
[] spawn {

  while {GAMEPHASE < 3} do {

    //respawn without wave if team just captured the first FOB
    if (fobFreeRespawnBlu) then {
      WAVERESPAWNBLU = true;
      sleep RESPAWNTIME + 10;
      WAVERESPAWNBLU = false;
      /*["WEST"] call mcd_fnc_removeRespawnedFromList;*/
    };

    //check current dead players
    if (count deadPlayersBlu >= RESPAWNWAVESIZE) then {
      WAVERESPAWNBLU = true;
      diag_log format ["handleRespawns.sqf - %1 players in Blufor wave. Respawning now possible.", count deadPlayersBlu];

      sleep RESPAWNWAVEEXTRATIME;

      WAVERESPAWNBLU = false;
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
    if (fobFreeRespawnOpf) then {
      WAVERESPAWNOpf = true;
      sleep RESPAWNTIME + 10;
      WAVERESPAWNOPF = false;
      /*["EAST"] call mcd_fnc_removeRespawnedFromList;*/
    };

    //check current dead players
    if (count deadPlayersOpf >= RESPAWNWAVESIZE) then {
      WAVERESPAWNOPF = true;
      diag_log format ["handleRespawns.sqf - %1 players in Opfor wave. Respawning now possible.", count deadPlayersOpf];

      sleep RESPAWNWAVEEXTRATIME;

      WAVERESPAWNOPF = false;
      diag_log format ["handleRespawns.sqf - Respawning no longer possible for Opfor."];

      /*["EAST"] call mcd_fnc_removeRespawnedFromList;*/
    };

    sleep 2;
  };
};
