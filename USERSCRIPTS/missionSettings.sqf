author = "Name für Gruppe Adler";       //mission author
onLoadName = "ENDGAME TEMPLATE";        //mission name (using allcaps looks better)
onLoadMission = "";                     //description in loadscreen
loadScreen = "data\loadpic.paa";        //picture in loadscreen

RESPAWNTIME = 150;                      //delay before player gets added to the wave
WAVERESPAWNTIME = 270;                  //delay before a complete wave respawns
RESPAWNWAVEEXTRATIME = 60;              //time after a wave has respawned, that an additional player may respawn alone in
MAXRESPAWNTIME = 1200;                  //maximum time a player has to wait under any circumstances (will respawn alone if needed)
VEHICLERESPAWNTIME = 400;               //time after which vehicles respawn
VEHICLERESPAWNRADIUS = 500;             //distance between startposition and current position for a vehicle to start the respawn timer

UPLOADSPEED = 1;                        //speed of 1 means ~ 90 second upload for one person / 45 second for two / etc.    speed of 0.5 means 180 seconds for one person
DLICONRANGE = 15;                       //range in meters at which 3D icon on intel is displayed - -1 to disable entirely - WARNING: values lower than 4 may cause inability to access large download objects (vehicles, cargo containers, ...)
EXACTINTELPOSITIONS = false;            //phase 2 task markers are exactly on intel positions - if false, trigger area is marked instead
DEFMARKERONUL = false;                  //phase 3 - defending team will only be able to see the upload point once the attacking team has started uploading
SCHEMATICSREVEALTIME = -1;              //if phase 2 winner fails to pick up schematics for this long after phase 3 start, they are revealed to the other team - set to -1 to disable
MAXTIMETOENDGAME = 7200;                //maximum time in seconds, after which phase 3 will start regardless of how much intel was found - set to -1 to disable

FRIENDLYUPLOADAI = true;               //spawn AI at upload position that is allied to uploading side - if this is false you can ignore the following settings
FRIENDLYAIRADIUS = 100;                 //radius around upload position that friendly AI spawn in
FRIENDLYAIAMOUNT = [10,15];             //amount of friendly AI - can be a whole number or an array - if array, actual amount is random between the first and the second number in array

AUTOMATICRADIOS = false;                //automatically give players the correct radios - set this to true if you want to use vanilla loadouts
SAMEENCRYPTION = true;                  //enables radios of all sides to receive each other - use this if you want to give players a BLUFOR longrange and an INDEPENDENT shortrange (for example) - BLUFOR and OPFOR hear each other if both are on the same frequency
BLUFORSWRADIO = "tf_anprc152";          //blufor sw radio classname - check below for available classnames (radio classnames)
OPFORSWRADIO = "tf_fadak";              //opfor sw radio classname - check below for available classnames (radio classnames)
BLUFORLRRADIO = "tf_rt1523g_big_rhs";   //blufor longrange radio classname - check below for available classnames (radio classnames)
OPFORLRRADIO = "tf_mr3000_rhs";         //opfor longrange radio classname - check below for available classnames (radio classnames)

LOADOUTFACTIONBLU = "US_OCP";           //sets BLUFOR loadout faction
LOADOUTFACTIONOPF = "RU_EMR";           //sets OPFOR loadout faction
