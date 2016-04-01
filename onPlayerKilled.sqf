/*  handles player respawn
*
*   executed locally when player dies
*/

if (GAMEPHASE >= 3) exitWith {call mcd_fnc_startSpectator};

private ["_timeleft","_minutes","_seconds","_respawnIn"];

//keep player from respawning
setPlayerRespawnTime 9999;
sleep 2;



//declare/define variables =====================================================
_rule = parseText "<t align='center'><t color='#708090'>----------------------------------------------<br /></t></t>";
_lineBreak = parseText "<br />";
_timeleft = RESPAWNTIME;
_waitCondition = {};
_playersLeft = {};

if (originalSide == "WEST") then {
  _waitCondition = compile "!WAVERESPAWNBLU";
  _playersLeft = {WAVERESPAWNPLAYERSLEFTBLU};
  diag_log "onPlayerKilled - player side is WEST";
};
if (originalSide == "EAST") then {
  _waitCondition = compile "!WAVERESPAWNOPF";
  _playersLeft = {WAVERESPAWNPLAYERSLEFTOPF};
  diag_log "onPlayerKilled - player side is EAST";
};



//respawn countdown ============================================================
while {_timeleft > 0} do {
  //countdown
  _timeleft = _timeleft - 1;
  _minutes = str (floor (_timeleft/60));
  _seconds = floor (_timeleft mod 60);
  if (_seconds<10) then {_seconds = "0" + str _seconds} else {_seconds = str _seconds};
  _respawnIn = parseText format ["<t align='center'>Respawn bereit in <t color='#ffff00'>%1:%2</t></t>", _minutes, _seconds];

  //wave
  _waveLeft = parseText format ["<t align='center'>Warte auf <t color='#ffff00'>%1 weitere Spieler</t></t>", call _playersLeft];

  //compose hint
  hint composeText [_rule, _respawnIn, _lineBreak, _waveLeft, _lineBreak, _rule];

  sleep 1;

  if (GAMEPHASE >= 3) exitWith {};
};
if (GAMEPHASE >= 3) exitWith {call mcd_fnc_startSpectator};

//send command to server to add player to wave array
[str player, originalSide] remoteExec ["mcd_fnc_addDeadPlayerToWave",2,false];



//wait until enough players in wave ============================================
while _waitCondition do {
  _respawnIn = parseText format ["<t align='center'>Respawn <t color='#ffff00'>bereit</t></t>"];
  _waveLeft = parseText format ["<t align='center'>Warte auf <t color='#ffff00'>%1 weitere Spieler</t></t>", call _playersLeft];
  hint composeText [_rule, _respawnIn, _lineBreak, _waveLeft, _lineBreak, _rule];

  sleep 1;

  if (GAMEPHASE >= 3) exitWith {};
};
if (GAMEPHASE >= 3) exitWith {call mcd_fnc_startSpectator};
sleep 0.5;



//respawn ======================================================================

//respawn hint
_respawning = parseText format ["<t align='center' color='#ffff00'>Respawning...</t>"];
hint composeText [_rule, _respawning, _lineBreak, _rule];
sleep 2;
//respawn player
setPlayerRespawnTime 0;
forceRespawn player;
hint "";
//make sure player doesn't instantly respawn next time
sleep 10;
setPlayerRespawnTime 9999;
