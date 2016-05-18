/*  BLUFOR EQUIPMENT ===========================================================
*
*   How to format loadout names in this file:
*     Add an underscore
*     Remove brackets and dots ()[]{}.
*     Replace spaces with underscores
*     Replace Umlauts with ae,oe,ue
*
*   Example:
*     Schütze (AT) -->  _schuetze_at
*/
this = player;
// =============================================================================


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
  this forceAddUniform "U_B_CombatUniform_mcam";
  this addItemToUniform "FirstAidKit";
  for "_i" from 1 to 2 do {this addItemToUniform "30Rnd_65x39_caseless_mag";};
  this addVest "V_PlateCarrier2_rgr";
  for "_i" from 1 to 3 do {this addItemToVest "30Rnd_65x39_caseless_mag";};
  for "_i" from 1 to 2 do {this addItemToVest "16Rnd_9x21_Mag";};
  this addItemToVest "SmokeShell";
  this addItemToVest "SmokeShellGreen";
  for "_i" from 1 to 2 do {this addItemToVest "Chemlight_green";};
  this addBackpack "B_AssaultPack_rgr_LAT";
  this addHeadgear "H_HelmetB_sand";

  comment "Add weapons";
  this addWeapon "arifle_MX_ACO_pointer_F";
  this addPrimaryWeaponItem "acc_pointer_IR";
  this addPrimaryWeaponItem "optic_Aco";
  this addWeapon "launch_NLAW_F";
  this addWeapon "hgun_P07_F";

  comment "Add items";
  this linkItem "ItemMap";
  this linkItem "ItemCompass";
  this linkItem "ItemWatch";
  this linkItem "NVGoggles";
};
