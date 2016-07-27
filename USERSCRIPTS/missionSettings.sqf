author = "Name für Gruppe Adler";     //mission author
onLoadName = "ENDGAME TEMPLATE";      //mission name
onLoadMission = "";                   //description in loadscreen
loadScreen = "data\loadpic.paa";      //picture in loadscreen

USECUSTOMLOADOUTS = true;             //use custom loadouts defined in bluforLoadouts.sqf and opforLoadouts.sqf?  (true/false)
RESPAWNTIME = 150;                    //delay before player gets added to the wave
WAVERESPAWNTIME = 270;                //delay before a complete wave respawns
RESPAWNWAVEEXTRATIME = 30;            //time after a wave has respawned, that an additional player may respawn alone in
MAXRESPAWNTIME = 1200;                //maximum time a player has to wait under any circumstances (will respawn alone if needed)
VEHICLERESPAWNTIME = 400;             //time after which vehicles respawn
VEHICLERESPAWNRADIUS = 500;           //distance between startposition and current position for a vehicle to start the respawn timer
UPLOADSPEED = 1;                      //speed of 1 means ~ 90 second upload for one person / 45 second for two / etc.    speed of 0.5 means 180 seconds for one person
DLICONRANGE = 15;                     //range in meters at which 3D icon on intel is displayed - 0 to disable entirely - WARNING: values lower than 4 may cause unability to access large download objects (vehicles, cargo containers, ...)
#define CIVTRAFFIC 0                  //civilian traffic parameter default value - 0: traffic off - 1: traffic on

AUTOMATICRADIOS = false;              //automatically give players the correct radios - set this to true if you want to use vanilla loadouts
BLUFORSWRADIO = "tf_anprc152";        //blufor sw radio classname - alternatives: tf_rf7800str, tf_anprc154, tf_pnr1000a, tf_anprc148jem
OPFORSWRADIO = "tf_fadak";            //opfor sw radio classname - alternatives: tf_rf7800str, tf_anprc154, tf_pnr1000a, tf_anprc148jem
BLUFORLRRADIO = "tf_rt1523g_big_rhs"; //blufor longrange radio classname
OPFORLRRADIO = "tf_mr3000_rhs";       //opfor longrange radio classname



/*radio classnames *************************************************************
* handheld:
*   tf_anprc152   - default blufor
*   tf_fadak      - default opfor
*   tf_rf7800str
*   tf_anprc154
*   tf_pnr1000a
*   tf_anprc148jem
*
* backpack:                      camo:
*   tf_mr3000_rhs               (EMR summer) - default opfor
*   tf_bussole                  (EMR summer)
*   tf_mr3000                   (CSAT hex camo)

*   tf_rt1523g_big_rhs          (multicam) - default blufor
*   tf_rt1523g_rhs              (multicam)
*   tf_mr3000_multicam          (multicam)
*   tf_mr3000_bwmod             (flecktarn)
*   tf_rt1523g_big_bwmod        (flecktarn)
*   tf_rt1523g_bwmod            (flecktarn)
*   tf_mr3000_bwmod_tropen      (tropentarn)
*   tf_rt1523g_big_bwmod_tropen (tropentarn)
*   tf_anarc210                 (similar to UCP)
*   tf_rt1523g                  (MTP)
*   tf_rt1523g_big              (MTP)

*   tf_anarc164                 (generic wooland camo)
*   tf_anprc155                 (AAF digi camo)
*   tf_anprc155_coyote          (coyote)
*   tf_mr6000l                  (tan)
*   tf_rt1523g_black            (black)
*   tf_rt1523g_fabric           (green)
*   tf_rt1523g_green            (olive)
*   tf_rt1523g_sage             (sage)
*******************************************************************************/
