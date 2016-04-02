//OPFOR EQUIPMENT ==============================================================

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
	player forceAddUniform "rds_uniform_citizen4";
	for "_i" from 1 to 8 do {player addItemToUniform "ACE_fieldDressing";};
	for "_i" from 1 to 2 do {player addItemToUniform "ACE_EarPlugs";};
	for "_i" from 1 to 4 do {player addItemToUniform "ACE_morphine";};
	player addVest "V_Vest_light_Invisible";
	for "_i" from 1 to 9 do {player addItemToVest "rhs_30Rnd_545x39_AK";};
	player addHeadgear "rhs_beanie_green";

	comment "Add weapons";
	player addWeapon "rhs_weap_ak74m_camo";
	player addPrimaryWeaponItem "rhs_acc_dtk";
	player addPrimaryWeaponItem "rhs_acc_2dpZenit";
	player addPrimaryWeaponItem "rhs_acc_pkas";
	player addWeapon "Binocular";

	comment "Add items";
	player linkItem "ItemMap";
	player linkItem "ItemCompass";
	player linkItem "ItemWatch";
	player linkItem "tf_fadak";
	player linkItem "ItemGPS";
};
