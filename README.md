# Gruppe Adler EndGame Template

This template brings BI's gamemode *EndGame* up to par with GA's gameplay standards. 
It provides the mission creator with a range of functions that automatically do the out-of-editor work for him. All the necessary mission modules come pre-placed and mostly pre-configured.

## Differences to Vanilla EndGame
* removed revive ability (only ACE now)
* removed 3D task markers
* removed 3D and 2D schematics carrier marker
* removed map markers that showed presence of enemies in bases
* removed ability to pick respawn point (only FOB now)
* removed respawn in phase 3 (dead players become spectators)
* wave respawn system (see below)
 
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
There will be a video tutorial here soon. It will be in German though. However, if you have some experience, you will be able to figure out how to create the mission by looking at the template in the editor.
