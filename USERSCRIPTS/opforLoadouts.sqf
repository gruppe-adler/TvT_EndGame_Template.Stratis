/*	OPFOR EQUIPMENT ============================================================
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


_hassam_tl = {
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
	this forceAddUniform "U_O_CombatUniform_ocamo";
	this addItemToUniform "FirstAidKit";
	for "_i" from 1 to 2 do {this addItemToUniform "30Rnd_65x39_caseless_green";};
	this addVest "V_HarnessOGL_brn";
	this addItemToVest "30Rnd_65x39_caseless_green";
	for "_i" from 1 to 2 do {this addItemToVest "30Rnd_65x39_caseless_green_mag_Tracer";};
	for "_i" from 1 to 2 do {this addItemToVest "16Rnd_9x21_Mag";};
	for "_i" from 1 to 2 do {this addItemToVest "MiniGrenade";};
	for "_i" from 1 to 5 do {this addItemToVest "1Rnd_HE_Grenade_shell";};
	this addItemToVest "SmokeShell";
	this addItemToVest "SmokeShellRed";
	this addItemToVest "SmokeShellOrange";
	this addItemToVest "SmokeShellYellow";
	for "_i" from 1 to 2 do {this addItemToVest "Chemlight_red";};
	for "_i" from 1 to 2 do {this addItemToVest "1Rnd_Smoke_Grenade_shell";};
	this addItemToVest "1Rnd_SmokeRed_Grenade_shell";
	this addItemToVest "1Rnd_SmokeOrange_Grenade_shell";
	this addItemToVest "1Rnd_SmokeYellow_Grenade_shell";
	this addHeadgear "H_HelmetLeaderO_ocamo";

	comment "Add weapons";
	this addWeapon "arifle_Katiba_GL_ARCO_pointer_F";
	this addPrimaryWeaponItem "acc_pointer_IR";
	this addPrimaryWeaponItem "optic_Arco";
	this addWeapon "hgun_Rook40_F";
	this addWeapon "Binocular";

	comment "Add items";
	this linkItem "ItemMap";
	this linkItem "ItemCompass";
	this linkItem "ItemWatch";
	this linkItem "ItemGPS";
	this linkItem "NVGoggles_OPFOR";
};
