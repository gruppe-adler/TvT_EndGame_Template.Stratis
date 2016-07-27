/*	OPFOR EQUIPMENT ============================================================
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
	this forceAddUniform "rhs_uniform_vdv_emr";
	this addItemToUniform "FirstAidKit";
	for "_i" from 1 to 10 do {this addItemToUniform "ACE_fieldDressing";};
	for "_i" from 1 to 2 do {this addItemToUniform "ACE_CableTie";};
	this addItemToUniform "ACE_epinephrine";
	for "_i" from 1 to 4 do {this addItemToUniform "ACE_morphine";};
	this addVest "rhs_6b23_digi_6sh92_radio";
	for "_i" from 1 to 9 do {this addItemToVest "rhs_30Rnd_545x39_AK";};
	this addBackpack "tf_mr3000_rhs";
	for "_i" from 1 to 6 do {this addItemToBackpack "rhs_mag_rdg2_white";};
	for "_i" from 1 to 2 do {this addItemToBackpack "rhs_mag_rgn";};
	this addHeadgear "rhs_6b27m_green_ess";

	comment "Add weapons";
	this addWeapon "rhs_weap_ak105";
	this addItemToVest "rhs_30Rnd_545x39_AK";
	this addPrimaryWeaponItem "rhs_acc_dtk";
	this addPrimaryWeaponItem "rhs_acc_2dpZenit";
	this addPrimaryWeaponItem "rhs_acc_pkas";
	this addWeapon "Binocular";

	comment "Add items";
	this linkItem "ItemMap";
	this linkItem "ItemCompass";
	this linkItem "ItemWatch";
	this linkItem "tf_fadak";
	this linkItem "ItemGPS";
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
	this forceAddUniform "rhs_uniform_vdv_emr";
	this addItemToUniform "FirstAidKit";
	for "_i" from 1 to 10 do {this addItemToUniform "ACE_fieldDressing";};
	for "_i" from 1 to 2 do {this addItemToUniform "ACE_CableTie";};
	this addItemToUniform "ACE_epinephrine";
	for "_i" from 1 to 4 do {this addItemToUniform "ACE_morphine";};
	this addVest "rhs_6b23_digi_6sh92_radio";
	for "_i" from 1 to 9 do {this addItemToVest "rhs_30Rnd_545x39_AK";};
	this addBackpack "tf_mr3000_rhs";
	for "_i" from 1 to 6 do {this addItemToBackpack "rhs_mag_rdg2_white";};
	for "_i" from 1 to 2 do {this addItemToBackpack "rhs_mag_rgn";};
	this addHeadgear "rhs_6b27m_green_ess";

	comment "Add weapons";
	this addWeapon "rhs_weap_ak105";
	this addItemToVest "rhs_30Rnd_545x39_AK";
	this addPrimaryWeaponItem "rhs_acc_dtk";
	this addPrimaryWeaponItem "rhs_acc_2dpZenit";
	this addPrimaryWeaponItem "rhs_acc_pkas";
	this addWeapon "Binocular";

	comment "Add items";
	this linkItem "ItemMap";
	this linkItem "ItemCompass";
	this linkItem "ItemWatch";
	this linkItem "tf_fadak";
	this linkItem "ItemGPS";
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
	this forceAddUniform "rhs_uniform_vdv_emr";
	this addItemToUniform "FirstAidKit";
	for "_i" from 1 to 10 do {this addItemToUniform "ACE_fieldDressing";};
	for "_i" from 1 to 2 do {this addItemToUniform "ACE_CableTie";};
	this addItemToUniform "ACE_epinephrine";
	for "_i" from 1 to 4 do {this addItemToUniform "ACE_morphine";};
	this addVest "rhs_6b23_digi_medic";
	for "_i" from 1 to 10 do {this addItemToVest "rhs_30Rnd_545x39_AK";};
	this addItemToVest "rhs_mag_rgn";
	this addBackpack "rhs_assault_umbts";
	for "_i" from 1 to 40 do {this addItemToBackpack "ACE_fieldDressing";};
	for "_i" from 1 to 10 do {this addItemToBackpack "ACE_epinephrine";};
	for "_i" from 1 to 20 do {this addItemToBackpack "ACE_morphine";};
	for "_i" from 1 to 6 do {this addItemToBackpack "rhs_mag_rdg2_white";};
	for "_i" from 1 to 5 do {this addItemToBackpack "ACE_bloodIV_500";};
	this addHeadgear "rhs_6b27m_green";

	comment "Add weapons";
	this addWeapon "rhs_weap_ak105";
	this addPrimaryWeaponItem "rhs_acc_dtk";
	this addPrimaryWeaponItem "rhs_acc_2dpZenit";
	this addPrimaryWeaponItem "rhs_acc_pkas";
	this addWeapon "Binocular";

	comment "Add items";
	this linkItem "ItemMap";
	this linkItem "ItemCompass";
	this linkItem "ItemWatch";
	this linkItem "tf_fadak";
	this linkItem "ItemGPS";
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
	this forceAddUniform "rhs_uniform_vdv_emr";
	this addItemToUniform "FirstAidKit";
	for "_i" from 1 to 10 do {this addItemToUniform "ACE_fieldDressing";};
	for "_i" from 1 to 2 do {this addItemToUniform "ACE_CableTie";};
	this addItemToUniform "ACE_epinephrine";
	for "_i" from 1 to 4 do {this addItemToUniform "ACE_morphine";};
	this addVest "rhs_6b23_digi_vydra_3m";
	for "_i" from 1 to 9 do {this addItemToVest "rhs_30Rnd_545x39_AK";};
	this addBackpack "rhs_assault_umbts";
	for "_i" from 1 to 2 do {this addItemToBackpack "rhs_rpg7_PG7VL_mag";};
	for "_i" from 1 to 4 do {this addItemToBackpack "rhs_mag_rdg2_white";};
	for "_i" from 1 to 2 do {this addItemToBackpack "rhs_mag_rgn";};
	this addHeadgear "rhs_6b27m_green";

	comment "Add weapons";
	this addWeapon "rhs_weap_ak105";
	this addPrimaryWeaponItem "rhs_acc_dtk";
	this addPrimaryWeaponItem "rhs_acc_2dpZenit";
	this addPrimaryWeaponItem "rhs_acc_pkas";
	this addWeapon "rhs_weap_rpg7";
	this addWeapon "Binocular";

	comment "Add items";
	this linkItem "ItemMap";
	this linkItem "ItemCompass";
	this linkItem "ItemWatch";
	this linkItem "tf_fadak";
	this linkItem "ItemGPS";
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
	this forceAddUniform "rhs_uniform_vdv_emr";
	this addItemToUniform "FirstAidKit";
	for "_i" from 1 to 10 do {this addItemToUniform "ACE_fieldDressing";};
	for "_i" from 1 to 2 do {this addItemToUniform "ACE_CableTie";};
	this addItemToUniform "ACE_epinephrine";
	for "_i" from 1 to 4 do {this addItemToUniform "ACE_morphine";};
	this addVest "rhs_6b23_digi_6sh92_vog";
	for "_i" from 1 to 10 do {this addItemToVest "rhs_30Rnd_545x39_AK";};
	this addBackpack "rhs_assault_umbts";
	for "_i" from 1 to 4 do {this addItemToBackpack "rhs_mag_rgn";};
	for "_i" from 1 to 6 do {this addItemToBackpack "rhs_mag_rdg2_white";};
	for "_i" from 1 to 10 do {this addItemToBackpack "rhs_GRD40_Green";};
	this addHeadgear "rhs_6b27m_green_bala";

	comment "Add weapons";
	this addWeapon "rhs_weap_ak74m_gp25";
	this addPrimaryWeaponItem "rhs_acc_dtk";
	this addPrimaryWeaponItem "rhs_acc_pkas";
	this addWeapon "Binocular";

	comment "Add items";
	this linkItem "ItemMap";
	this linkItem "ItemCompass";
	this linkItem "ItemWatch";
	this linkItem "tf_fadak";
	this linkItem "ItemGPS";
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
	this forceAddUniform "rhs_uniform_vdv_emr";
	this addItemToUniform "FirstAidKit";
	for "_i" from 1 to 10 do {this addItemToUniform "ACE_fieldDressing";};
	for "_i" from 1 to 2 do {this addItemToUniform "ACE_CableTie";};
	this addItemToUniform "ACE_epinephrine";
	for "_i" from 1 to 4 do {this addItemToUniform "ACE_morphine";};
	this addVest "rhs_6b23_digi_6sh92_headset";
	for "_i" from 1 to 2 do {this addItemToVest "rhs_mag_rdg2_white";};
	for "_i" from 1 to 2 do {this addItemToVest "rhs_mag_rgn";};
	this addItemToVest "rhs_100Rnd_762x54mmR";
	this addBackpack "rhs_assault_umbts";
	for "_i" from 1 to 3 do {this addItemToBackpack "rhs_100Rnd_762x54mmR";};
	this addHeadgear "rhs_6b27m_green_bala";

	comment "Add weapons";
	this addWeapon "rhs_weap_pkp";
	this addItemToVest "rhs_100Rnd_762x54mmR";
	this addWeapon "Binocular";

	comment "Add items";
	this linkItem "ItemMap";
	this linkItem "ItemCompass";
	this linkItem "ItemWatch";
	this linkItem "tf_fadak";
	this linkItem "ItemGPS";
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
	this forceAddUniform "rhs_uniform_vdv_emr";
	this addItemToUniform "FirstAidKit";
	for "_i" from 1 to 10 do {this addItemToUniform "ACE_fieldDressing";};
	for "_i" from 1 to 2 do {this addItemToUniform "ACE_CableTie";};
	this addItemToUniform "ACE_epinephrine";
	for "_i" from 1 to 4 do {this addItemToUniform "ACE_morphine";};
	this addVest "rhs_6b23_digi_6sh92";
	for "_i" from 1 to 9 do {this addItemToVest "rhs_30Rnd_545x39_AK";};
	this addBackpack "rhs_assault_umbts";
	for "_i" from 1 to 2 do {this addItemToBackpack "rhs_mag_rgn";};
	for "_i" from 1 to 4 do {this addItemToBackpack "rhs_mag_rdg2_white";};
	for "_i" from 1 to 2 do {this addItemToBackpack "rhs_100Rnd_762x54mmR";};
	this addHeadgear "rhs_6b27m_green";

	comment "Add weapons";
	this addWeapon "rhs_weap_ak105";
	this addPrimaryWeaponItem "rhs_acc_dtk";
	this addPrimaryWeaponItem "rhs_acc_2dpZenit";
	this addPrimaryWeaponItem "rhs_acc_pkas";
	this addWeapon "Binocular";

	comment "Add items";
	this linkItem "ItemMap";
	this linkItem "ItemCompass";
	this linkItem "ItemWatch";
	this linkItem "tf_fadak";
	this linkItem "ItemGPS";
};
