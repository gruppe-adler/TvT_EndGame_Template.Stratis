/*  BLUFOR EQUIPMENT ===========================================================
*
*   How to format loadout names in this file:
*     Add an underscore
*     Remove brackets ()[]{}
*     Replace spaces with underscores
*     Replace Umlauts with ae,oe,ue
*
*   Example:
*     Schütze (AT) -->  _schuetze_at
*/
this = player;
// =============================================================================
_gruppenfuehrer = {
  comment "Exported from Arsenal by McDiod";

  comment "Remove existing items";
  removeAllWeapons this;
  removeAllItems this;
  removeAllAssignedItems this;
  removeUniform this;
  removeVest this;
  removeBackpack this;
  removeHeadgear this;
  removeGoggles this;

  comment "Add containers";
  this forceAddUniform "rhs_uniform_cu_ocp";
  for "_i" from 1 to 10 do {this addItemToUniform "ACE_fieldDressing";};
  for "_i" from 1 to 4 do {this addItemToUniform "ACE_morphine";};
  this addItemToUniform "ACE_epinephrine";
  this addItemToUniform "ACE_MapTools";
  for "_i" from 1 to 2 do {this addItemToUniform "ACE_CableTie";};
  this addVest "rhsusf_iotv_ocp_Squadleader";
  for "_i" from 1 to 2 do {this addItemToVest "rhsusf_mag_15Rnd_9x19_JHP";};
  for "_i" from 1 to 10 do {this addItemToVest "rhs_mag_30Rnd_556x45_Mk262_Stanag";};
  for "_i" from 1 to 2 do {this addItemToVest "rhs_mag_an_m8hc";};
  for "_i" from 1 to 2 do {this addItemToVest "rhs_mag_m67";};
  this addItemToVest "SmokeShellBlue";
  this addItemToVest "SmokeShellGreen";
  this addItemToVest "SmokeShellOrange";
  this addItemToVest "SmokeShellPurple";
  this addItemToVest "SmokeShellRed";
  this addBackpack "tf_rt1523g_big_rhs";
  this addHeadgear "rhsusf_ach_helmet_headset_ocp";

  comment "Add weapons";
  this addWeapon "rhs_weap_m4a1_carryhandle";

  this addPrimaryWeaponItem "rhsusf_acc_compm4";
  this addWeapon "rhsusf_weap_m9";
  this addWeapon "Binocular";

  comment "Add items";
  this linkItem "ItemMap";
  this linkItem "ItemCompass";
  this linkItem "ItemWatch";
  this linkItem "ItemGPS";
	this linkItem "tf_anprc152";
};

_truppfuehrer = {
  comment "Exported from Arsenal by McDiod";

  comment "Remove existing items";
  removeAllWeapons this;
  removeAllItems this;
  removeAllAssignedItems this;
  removeUniform this;
  removeVest this;
  removeBackpack this;
  removeHeadgear this;
  removeGoggles this;

  comment "Add containers";
  this forceAddUniform "rhs_uniform_cu_ocp";
  for "_i" from 1 to 10 do {this addItemToUniform "ACE_fieldDressing";};
  for "_i" from 1 to 4 do {this addItemToUniform "ACE_morphine";};
  this addItemToUniform "ACE_epinephrine";
  this addItemToUniform "ACE_MapTools";
  for "_i" from 1 to 2 do {this addItemToUniform "ACE_CableTie";};
  this addVest "rhsusf_iotv_ocp_Teamleader";
  for "_i" from 1 to 2 do {this addItemToVest "rhsusf_mag_15Rnd_9x19_JHP";};
  for "_i" from 1 to 10 do {this addItemToVest "rhs_mag_30Rnd_556x45_Mk262_Stanag";};
  for "_i" from 1 to 2 do {this addItemToVest "rhs_mag_an_m8hc";};
  for "_i" from 1 to 2 do {this addItemToVest "rhs_mag_m67";};
  this addItemToVest "SmokeShellBlue";
  this addItemToVest "SmokeShellGreen";
  this addItemToVest "SmokeShellOrange";
  this addItemToVest "SmokeShellPurple";
  this addItemToVest "SmokeShellRed";
  this addBackpack "tf_rt1523g_big_rhs";
  this addHeadgear "rhsusf_ach_helmet_headset_ocp";

  comment "Add weapons";
  this addWeapon "rhs_weap_m4a1_carryhandle";

  this addPrimaryWeaponItem "rhsusf_acc_compm4";
  this addWeapon "rhsusf_weap_m9";
  this addWeapon "Binocular";

  comment "Add items";
  this linkItem "ItemMap";
  this linkItem "ItemCompass";
  this linkItem "ItemWatch";
  this linkItem "ItemGPS";
	this linkItem "tf_anprc152";
};

_sanitaeter = {
  comment "Exported from Arsenal by McDiod";

  comment "Remove existing items";
  removeAllWeapons this;
  removeAllItems this;
  removeAllAssignedItems this;
  removeUniform this;
  removeVest this;
  removeBackpack this;
  removeHeadgear this;
  removeGoggles this;

  comment "Add containers";
  this forceAddUniform "rhs_uniform_cu_ocp";
  for "_i" from 1 to 10 do {this addItemToUniform "ACE_fieldDressing";};
  for "_i" from 1 to 4 do {this addItemToUniform "ACE_morphine";};
  this addItemToUniform "ACE_epinephrine";
  this addItemToUniform "ACE_MapTools";
  for "_i" from 1 to 2 do {this addItemToUniform "ACE_CableTie";};
  this addVest "rhsusf_iotv_ocp_Squadleader";
  for "_i" from 1 to 2 do {this addItemToVest "rhsusf_mag_15Rnd_9x19_JHP";};
  for "_i" from 1 to 10 do {this addItemToVest "rhs_mag_an_m8hc";};
  for "_i" from 1 to 2 do {this addItemToVest "rhs_mag_m67";};
  for "_i" from 1 to 10 do {this addItemToVest "rhs_mag_30Rnd_556x45_Mk262_Stanag";};
  this addBackpack "rhsusf_assault_eagleaiii_ocp";
  for "_i" from 1 to 40 do {this addItemToBackpack "ACE_fieldDressing";};
  for "_i" from 1 to 30 do {this addItemToBackpack "ACE_morphine";};
  for "_i" from 1 to 20 do {this addItemToBackpack "ACE_epinephrine";};
  for "_i" from 1 to 5 do {this addItemToBackpack "ACE_bloodIV_500";};
  this addHeadgear "rhsusf_ach_helmet_headset_ocp";

  comment "Add weapons";
  this addWeapon "rhs_weap_m4a1_carryhandle";

  this addPrimaryWeaponItem "rhsusf_acc_compm4";
  this addWeapon "rhsusf_weap_m9";
  this addWeapon "Binocular";

  comment "Add items";
  this linkItem "ItemMap";
  this linkItem "ItemCompass";
  this linkItem "ItemWatch";
  this linkItem "ItemGPS";
	this linkItem "tf_anprc152";
};

_schuetze_at = {
  comment "Exported from Arsenal by McDiod";

  comment "Remove existing items";
  removeAllWeapons this;
  removeAllItems this;
  removeAllAssignedItems this;
  removeUniform this;
  removeVest this;
  removeBackpack this;
  removeHeadgear this;
  removeGoggles this;

  comment "Add containers";
  this forceAddUniform "rhs_uniform_cu_ocp";
  for "_i" from 1 to 10 do {this addItemToUniform "ACE_fieldDressing";};
  for "_i" from 1 to 4 do {this addItemToUniform "ACE_morphine";};
  this addItemToUniform "ACE_epinephrine";
  this addItemToUniform "ACE_MapTools";
  for "_i" from 1 to 2 do {this addItemToUniform "ACE_CableTie";};
  this addVest "rhsusf_iotv_ocp_Rifleman";
  for "_i" from 1 to 2 do {this addItemToVest "rhsusf_mag_15Rnd_9x19_JHP";};
  for "_i" from 1 to 4 do {this addItemToVest "rhs_mag_an_m8hc";};
  for "_i" from 1 to 2 do {this addItemToVest "rhs_mag_m67";};
  for "_i" from 1 to 10 do {this addItemToVest "rhs_mag_30Rnd_556x45_Mk262_Stanag";};
  this addHeadgear "rhsusf_ach_helmet_headset_ocp";

  comment "Add weapons";
  this addWeapon "rhs_weap_m4a1_carryhandle";

  this addPrimaryWeaponItem "rhsusf_acc_compm4";
  this addWeapon "rhs_weap_M136";
  this addWeapon "rhsusf_weap_m9";
  this addWeapon "Binocular";

  comment "Add items";
  this linkItem "ItemMap";
  this linkItem "ItemCompass";
  this linkItem "ItemWatch";
  this linkItem "ItemGPS";
	this linkItem "tf_anprc152";
};

_grenadier = {
  comment "Exported from Arsenal by McDiod";

  comment "Remove existing items";
  removeAllWeapons this;
  removeAllItems this;
  removeAllAssignedItems this;
  removeUniform this;
  removeVest this;
  removeBackpack this;
  removeHeadgear this;
  removeGoggles this;

  comment "Add containers";
  this forceAddUniform "rhs_uniform_cu_ocp";
  for "_i" from 1 to 10 do {this addItemToUniform "ACE_fieldDressing";};
  for "_i" from 1 to 4 do {this addItemToUniform "ACE_morphine";};
  this addItemToUniform "ACE_epinephrine";
  this addItemToUniform "ACE_MapTools";
  for "_i" from 1 to 2 do {this addItemToUniform "ACE_CableTie";};
  this addVest "rhsusf_iotv_ocp_Grenadier";
  for "_i" from 1 to 2 do {this addItemToVest "rhsusf_mag_15Rnd_9x19_JHP";};
  for "_i" from 1 to 4 do {this addItemToVest "rhs_mag_m67";};
  for "_i" from 1 to 10 do {this addItemToVest "rhs_mag_30Rnd_556x45_Mk262_Stanag";};
  for "_i" from 1 to 8 do {this addItemToVest "1Rnd_Smoke_Grenade_shell";};
  this addHeadgear "rhsusf_ach_helmet_headset_ocp";

  comment "Add weapons";
  this addWeapon "rhs_weap_m4a1_m203";

  this addPrimaryWeaponItem "rhsusf_acc_compm4";
  this addWeapon "rhsusf_weap_m9";
  this addWeapon "Binocular";

  comment "Add items";
  this linkItem "ItemMap";
  this linkItem "ItemCompass";
  this linkItem "ItemWatch";
  this linkItem "ItemGPS";
	this linkItem "tf_anprc152";
};

_mg_schuetze = {
  comment "Exported from Arsenal by McDiod";

  comment "Remove existing items";
  removeAllWeapons this;
  removeAllItems this;
  removeAllAssignedItems this;
  removeUniform this;
  removeVest this;
  removeBackpack this;
  removeHeadgear this;
  removeGoggles this;

  comment "Add containers";
  this forceAddUniform "rhs_uniform_cu_ocp";
  for "_i" from 1 to 10 do {this addItemToUniform "ACE_fieldDressing";};
  for "_i" from 1 to 4 do {this addItemToUniform "ACE_morphine";};
  this addItemToUniform "ACE_epinephrine";
  this addItemToUniform "ACE_MapTools";
  for "_i" from 1 to 2 do {this addItemToUniform "ACE_CableTie";};
  this addVest "rhsusf_iotv_ocp_SAW";
  for "_i" from 1 to 2 do {this addItemToVest "rhs_mag_an_m8hc";};
  for "_i" from 1 to 2 do {this addItemToVest "rhs_mag_m67";};
  for "_i" from 1 to 2 do {this addItemToVest "rhsusf_100Rnd_556x45_soft_pouch";};
  this addBackpack "rhsusf_assault_eagleaiii_ocp";
  for "_i" from 1 to 2 do {this addItemToBackpack "rhs_200rnd_556x45_M_SAW";};
  this addHeadgear "rhsusf_ach_helmet_headset_ocp";

  comment "Add weapons";
  this addWeapon "rhs_weap_m249_pip_L_vfg";
  this addItemToBackpack "rhs_200rnd_556x45_M_SAW";

  this addWeapon "Binocular";

  comment "Add items";
  this linkItem "ItemMap";
  this linkItem "ItemCompass";
  this linkItem "ItemWatch";
  this linkItem "ItemGPS";
	this linkItem "tf_anprc152";
};

_mg_assistent = {
  comment "Exported from Arsenal by McDiod";

  comment "Remove existing items";
  removeAllWeapons this;
  removeAllItems this;
  removeAllAssignedItems this;
  removeUniform this;
  removeVest this;
  removeBackpack this;
  removeHeadgear this;
  removeGoggles this;

  comment "Add containers";
  this forceAddUniform "rhs_uniform_cu_ocp";
  for "_i" from 1 to 10 do {this addItemToUniform "ACE_fieldDressing";};
  for "_i" from 1 to 4 do {this addItemToUniform "ACE_morphine";};
  this addItemToUniform "ACE_epinephrine";
  this addItemToUniform "ACE_MapTools";
  for "_i" from 1 to 2 do {this addItemToUniform "ACE_CableTie";};
  this addVest "rhsusf_iotv_ocp_Squadleader";
  for "_i" from 1 to 2 do {this addItemToVest "rhsusf_mag_15Rnd_9x19_JHP";};
  for "_i" from 1 to 4 do {this addItemToVest "rhs_mag_an_m8hc";};
  for "_i" from 1 to 2 do {this addItemToVest "rhs_mag_m67";};
  for "_i" from 1 to 10 do {this addItemToVest "rhs_mag_30Rnd_556x45_Mk262_Stanag";};
  this addBackpack "rhsusf_assault_eagleaiii_ocp";
  for "_i" from 1 to 2 do {this addItemToBackpack "rhs_200rnd_556x45_M_SAW";};
  this addItemToBackpack "rhsusf_100Rnd_556x45_soft_pouch";
  this addHeadgear "rhsusf_ach_helmet_headset_ocp";

  comment "Add weapons";
  this addWeapon "rhs_weap_m4a1_carryhandle";

  this addPrimaryWeaponItem "rhsusf_acc_compm4";
  this addWeapon "rhsusf_weap_m9";
  this addWeapon "Binocular";

  comment "Add items";
  this linkItem "ItemMap";
  this linkItem "ItemCompass";
  this linkItem "ItemWatch";
  this linkItem "ItemGPS";
	this linkItem "tf_anprc152";
};
