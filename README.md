# Gruppe Adler EndGame Template

This template brings BI's gamemode *EndGame* up to par with GA's gameplay standards. 
It provides the mission creator with a range of functions that automatically do the out-of-editor work for him. All the necessary mission modules come pre-placed and mostly pre-configured.

## Differences to Vanilla EndGame
* removed revive ability (only ACE now)
* removed 3D task markers
* removed 3D and 2D schematics carrier marker
* removed map markers that showed presence of enemies in bases
* removed ability to pick respawn point (only FOB now)
* wave respawn system (see below)

#### Respawn System:  
* during phase 1 and 2 players may only respawn in waves
* wave size is dependant on number of players (or mission parameter)
* when a player dies, he sees a countdown after which he will be added to the next wave
* when the first player gets added to a wave, that wave's countdown starts
* the wave respawns as soon as it has enough players and its countdown ends
* players that die in phase 3 become spectators
 
![respawn system](http://i.imgur.com/XEFHgbZ.png)

## Using the Template

### Download and Installation
1. Download the [latest version here.](https://github.com/gruppe-adler/TvT_EndGame_Template.Stratis/releases) (Choose the .zip archive).  
2. Extract the archive to `Documents\Arma 3 - Other Profiles\YOURPROFILENAME\mpmissions` or `Documents\Arma 3\mpmissions` if you are using the default profile.
3. Rename the mission folder. Change the .Stratis if you want to use the template on a different map. The suffixes of some common maps are listed below.
4. Use a text editor to edit the scripts in the *USERSCRIPTS* folder.


#### Map Suffixes
| Map               | Suffix             | 
|-------------------|--------------------| 
| Altis             | Altis              | 
| Chernarus         | Chernarus          | 
| Chern. Sum.       | Chernarus_Summer   | 
| Esseker           | Esseker            | 
| PR Fata           | fata               | 
| Podagorsk         | FDF_Isle1_a        | 
| Ramahdi           | Intro              | 
| Kunduz            | Kunduz             | 
| Namalsk           | namalsk            | 
| Porto             | Porto              | 
| Proving Grounds   | ProvingGrounds_PMC | 
| United Sahrani    | Sara_dbe1          | 
| Shapur            | Shapur_BAF         | 
| Stratis           | Stratis            | 
| Sugar Lake        | SugarLake          | 
| Takistan          | Takistan           | 
| Utes              | utes               | 
| Virtual Reality   | VR                 | 
| VT5 Suomi Finland | vt5                | 
| Bystrica          | Woodland_ACR       | 
| Zargabad          | Zargabad           | 


### Updating to a Newer Version
In case you have started working on a mission and an update came along, you can do the following:  

1. Rename your missionfolder (i.e. *TvT_MyMission.Stratis.BACKUP*)
2. Download the new template, extract and rename the mission folder (i.e. *TvT_MyMission.Stratis*)
3. Copy and paste these files/folders from the old version to the new one:
  * mission.sqm
  * USERSCRIPTS
  
### Creating the Mission
Video tutorial (in German!):  
[![Tutorial on Youtube](http://i.imgur.com/sC3vEcZ.png)](https://www.youtube.com/watch?v=PB3oubi27bA "EndGame Video Tutorial")

#### Spawnpoints
* move *respawn_west* and *respawn_east* to the starting positions of both teams
* place player unit

#### FOBs
* move *EndGame Start Game Objective* module to the FOB positions (module will be respawn position after FOB is captured)
* define *Succeed Radius* in the module --> when all AI in this radius are dead, FOB is captured
* protect the FOBs with the Zone Protection module

#### Intel Bases
* build a base
* place download object `obj_download_i`
* create a trigger around the base (which encloses all objects belonging to that base)
* place an *EndGame Simple Objective* module and sync it with the trigger
* register the download object in the module
* sync the module with either the *EndGame Objectives Instance* module or and *EndGame Objective Randomizer*

#### Schematics
* place schematics objects `obj_pickup_i` (game will choose one at random)
* place upload objects `obj_upload_i` (game will choose two at random)
* register schematics and upload objects in the *EndGame Objective* module
* set timelimit for phase 3 in the module



