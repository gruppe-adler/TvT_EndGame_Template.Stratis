author = "Name für Gruppe Adler";     //mission author
onLoadName = "ENDGAME TEMPLATE";      //mission name (using allcaps looks better)
onLoadMission = "";                   //description in loadscreen
loadScreen = "data\loadpic.paa";      //picture in loadscreen

USECUSTOMLOADOUTS = true;             //use custom loadouts defined in bluforLoadouts.sqf and opforLoadouts.sqf?  (true/false)
#define CIVTRAFFIC 0                  //civilian traffic parameter default value - 0: traffic off - 1: traffic on

RESPAWNTIME = 150;                    //delay before player gets added to the wave
WAVERESPAWNTIME = 270;                //delay before a complete wave respawns
RESPAWNWAVEEXTRATIME = 30;            //time after a wave has respawned, that an additional player may respawn alone in
MAXRESPAWNTIME = 1200;                //maximum time a player has to wait under any circumstances (will respawn alone if needed)
VEHICLERESPAWNTIME = 400;             //time after which vehicles respawn
VEHICLERESPAWNRADIUS = 500;           //distance between startposition and current position for a vehicle to start the respawn timer

UPLOADSPEED = 1;                      //speed of 1 means ~ 90 second upload for one person / 45 second for two / etc.    speed of 0.5 means 180 seconds for one person
DLICONRANGE = 15;                     //range in meters at which 3D icon on intel is displayed - 0 to disable entirely - WARNING: values lower than 4 may cause unability to access large download objects (vehicles, cargo containers, ...)
DEFMARKERONUL = true;                 //phase 3 - defending team will only be able to see the upload point once the attacking team has started uploading
SCHEMATICSREVEALTIME = -1;            //if phase 2 winner fails to pick up schematics for this long after phase 3 start, they are revealed to the other team - set to -1 to disable entirely

FRIENDLYUPLOADAI = false;             //spawn AI at upload position that is allied to uploading side
FRIENDLYAIRADIUS = 100;               //radius around upload position that friendly AI spawn in
FRIENDLYAIAMOUNT = [10,15];           //amount of friendly AI - can be a whole number or an array - if array, actual amount is random between the first and the second number in array
BLUFORAIFACTION = "us_ocp";
OPFORAIFACTION = "rus_emr";

AUTOMATICRADIOS = false;              //automatically give players the correct radios - set this to true if you want to use vanilla loadouts
SAMEENCRYPTION = true;                //enables radios of all sides to receive each other - use this if you want to give players a BLUFOR longrange and an INDEPENDENT shortrange (for example) - BLUFOR and OPFOR hear each other if both are on the same frequency
BLUFORSWRADIO = "tf_anprc152";        //blufor sw radio classname - alternatives: tf_rf7800str, tf_anprc154, tf_pnr1000a, tf_anprc148jem
OPFORSWRADIO = "tf_fadak";            //opfor sw radio classname - alternatives: tf_rf7800str, tf_anprc154, tf_pnr1000a, tf_anprc148jem
BLUFORLRRADIO = "tf_rt1523g_big_rhs"; //blufor longrange radio classname
OPFORLRRADIO = "tf_mr3000_rhs";       //opfor longrange radio classname



/*radio classnames *************************************************************
* HANDHELD:
*   BLUFOR:
*   tf_anprc152   - default blufor
*   tf_rf7800str
*
*   OPFOR:
*   tf_fadak      - default opfor
*   tf_pnr1000a
*
*   INDEPENDENT:
*   tf_anprc148jem
*   tf_anprc154
*
*
* BACKPACK:                      camo:
*   BLUFOR:
*   tf_rt1523g_big_rhs          (multicam) - default blufor
*   tf_rt1523g_rhs              (multicam)
*   tf_rt1523g_big_bwmod        (flecktarn)
*   tf_rt1523g_bwmod            (flecktarn)
*   tf_mr3000_bwmod_tropen      (tropentarn)
*   tf_rt1523g_big_bwmod_tropen (tropentarn)
*   tf_anarc210                 (similar to UCP)
*   tf_rt1523g                  (MTP)
*   tf_rt1523g_big              (MTP)
*   tf_rt1523g_black            (black)
*   tf_rt1523g_fabric           (green)
*   tf_rt1523g_green            (olive)
*   tf_rt1523g_sage             (sage)
*
*   OPFOR:
*   tf_mr3000_rhs               (EMR summer) - default opfor
*   tf_mr3000_multicam          (multicam)
*   tf_mr3000_bwmod             (flecktarn)
*   tf_mr3000                   (CSAT hex camo)
*   tf_mr6000l                  (tan)
*   tf_bussole                  (EMR summer)
*
*   INDEPENDENT:
*   tf_anprc155                 (AAF digi camo)
*   tf_anprc155_coyote          (coyote)
*   tf_anarc164                 (generic wooland camo)

*******************************************************************************/
