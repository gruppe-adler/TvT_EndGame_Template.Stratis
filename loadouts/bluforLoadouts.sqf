//BLUFOR EQUIPMENT =============================================================

_rifleman = {
  comment "Exported from Arsenal by McDiod";

  comment "Remove existing items";
  removeAllWeapons player;
  removeAllItems player;
  removeAllAssignedItems player;
  removeUniform player;
  removeVest player;
  removeBackpack player;
  removeHeadgear player;
  removeGoggles player;

  comment "Add containers";
  player forceAddUniform "ARC_Common_Black_Uniform";
  for "_i" from 1 to 10 do {player addItemToUniform "ACE_fieldDressing";};
  for "_i" from 1 to 2 do {player addItemToUniform "ACE_EarPlugs";};
  for "_i" from 1 to 5 do {player addItemToUniform "ACE_morphine";};
  player addVest "V_Police_heavy";
  for "_i" from 1 to 9 do {player addItemToVest "30Rnd_556x45_Stanag";};

  for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
  for "_i" from 1 to 2 do {player addItemToVest "rhsusf_mag_15Rnd_9x19_JHP";};
  for "_i" from 1 to 2 do {player addItemToVest "SmokeShell";};
  player addHeadgear "SMA_Helmet_Black";
  player addGoggles "G_Balaclava_blk";

  comment "Add weapons";
  player addWeapon "Auto556x45_TAR21";
  player addPrimaryWeaponItem "rhsusf_acc_eotech_552";
  player addWeapon "rhsusf_weap_m9";
  player addWeapon "Binocular";

  comment "Add items";
  player linkItem "ItemMap";
  player linkItem "ItemCompass";
  player linkItem "ItemWatch";
  player linkItem "ItemGPS";
};
