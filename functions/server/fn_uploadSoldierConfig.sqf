/*  Defines sets of units to be spawned at upload positions on start of phase 3
*
*   included in server\uploadSoldiers.sqf
*
*
*   To define your own set:
*   * open 3d editor
*   * place all the units you want to have
*   * select them all
*   * rightclick --> log --> copy classes to clipboard
*   * in this file, create a new array that looks like this (you can use any name, just start it with _ ):
*         _my_units = [ ];
*   * paste the classnames into the brackets
*   * put "" around each classname
*   * put a comma behind every element except for the last one
*
*   You can now use "my_units" in your missionsettings.sqf
*/

//VANILLA ======================================================================
_nato_alt = [
  "B_Soldier_A_F",
  "B_soldier_AR_F",
  "B_medic_F",
  "B_Soldier_F",
  "B_soldier_LAT_F",
  "B_Soldier_lite_F"
];

_nato_tan = [
  "B_T_Soldier_A_F",
  "B_T_Soldier_AR_F",
  "B_T_Soldier_F",
  "B_T_Medic_F",
  "B_T_Soldier_LAT_F",
  "B_T_Officer_F"
];

_ctrg_tan = [
  "B_CTRG_Soldier_AR_tna_F",
  "B_CTRG_Soldier_Medic_tna_F",
  "B_CTRG_Soldier_tna_F",
  "B_CTRG_Soldier_LAT_tna_F"
];

_pol_tan = [
  "B_GEN_Soldier_F",
  "B_GEN_Commander_F"
];

_fia_alt = [
  "B_G_Soldier_AR_F",
  "B_G_Soldier_A_F",
  "B_G_Soldier_F",
  "B_G_Soldier_LAT_F",
  "B_G_Soldier_lite_F",
  "B_G_Soldier_SL_F"
];

_csat_alt = [
  "O_Soldier_AAR_F",
  "O_Soldier_AR_F",
  "O_medic_F",
  "O_Soldier_LAT_F",
  "O_Soldier_F",
  "O_Soldier_lite_F"
];

_csat_urb = [
  "O_soldierU_A_F",
  "O_soldierU_AAR_F",
  "O_soldierU_medic_F",
  "O_soldierU_F",
  "O_soldierU_LAT_F"
];

_csat_tan = [
  "O_T_Soldier_AAR_F",
  "O_T_Soldier_AR_F",
  "O_T_Medic_F",
  "O_T_Soldier_F",
  "O_T_Soldier_LAT_F"
];

_aaf_alt = [
  "I_Soldier_AAR_F",
  "I_Soldier_AR_F",
  "I_medic_F",
  "I_soldier_F",
  "I_Soldier_LAT_F",
  "I_Soldier_lite_F"
];

//RHS USAF =====================================================================
_us_ocp = [
  "rhsusf_army_ocp_rifleman",
  "rhsusf_army_ocp_riflemanat",
  "rhsusf_army_ocp_medic",
  "rhsusf_army_ocp_rifleman_m16",
  "rhsusf_army_ocp_riflemanl"
];

_us_ucp = [
  "rhsusf_army_ucp_autoriflemana",
  "rhsusf_army_ucp_rifleman",
  "rhsusf_army_ucp_riflemanl",
  "rhsusf_army_ucp_riflemanat",
  "rhsusf_army_ucp_rifleman_m16",
  "rhsusf_army_ucp_medic"
];

_usmc_des = [
  "rhsusf_usmc_marpat_d_autorifleman_m249_ass",
  "rhsusf_usmc_marpat_d_autorifleman_m249",
  "rhsusf_usmc_marpat_d_rifleman_light",
  "rhsusf_usmc_marpat_d_riflemanat",
  "rhsusf_usmc_marpat_d_rifleman_m4",
  "rhsusf_usmc_marpat_d_rifleman_law",
  "rhsusf_usmc_marpat_d_squadleader"
];

_usmc_wdl = [
  "rhsusf_usmc_marpat_wd_autorifleman_m249_ass",
  "rhsusf_usmc_marpat_wd_autorifleman_m249",
  "rhsusf_usmc_marpat_wd_machinegunner",
  "rhsusf_usmc_marpat_wd_rifleman_light",
  "rhsusf_usmc_marpat_wd_riflemanat",
  "rhsusf_usmc_marpat_wd_rifleman",
  "rhsusf_usmc_marpat_wd_rifleman_m4"
];

//RHS AFRF =====================================================================
_rus_emr = [
  "rhs_vdv_rifleman",
  "rhs_vdv_LAT",
  "rhs_vdv_RShG2",
  "rhs_vdv_medic",
  "rhs_vdv_machinegunner"
];

_rus_des = [
  "rhs_vdv_des_at",
  "rhs_vdv_des_arifleman",
  "rhs_vdv_des_machinegunner_assistant",
  "rhs_vdv_des_rifleman",
  "rhs_vdv_des_LAT",
  "rhs_vdv_des_medic"
];

_rus_flr = [
  "rhs_vdv_flora_at",
  "rhs_vdv_flora_machinegunner",
  "rhs_vdv_flora_machinegunner_assistant",
  "rhs_vdv_flora_medic",
  "rhs_vdv_flora_rifleman",
  "rhs_vdv_flora_LAT"
];

_rus_mfl = [
  "rhs_vdv_mflora_at",
  "rhs_vdv_mflora_machinegunner",
  "rhs_vdv_mflora_machinegunner_assistant",
  "rhs_vdv_mflora_medic",
  "rhs_vdv_mflora_rifleman",
  "rhs_vdv_mflora_LAT"
];

//RHS GREF =====================================================================
_cdf_gnd = [
  "rhsgref_cdf_b_reg_rifleman",
  "rhsgref_cdf_b_reg_rifleman_lite",
  "rhsgref_cdf_b_reg_rifleman_m70",
  "rhsgref_cdf_b_reg_squadleader",
  "rhsgref_cdf_b_reg_grenadier_rpg",
  "rhsgref_cdf_b_reg_machinegunner"
];

_cdf_ng = [
  "rhsgref_cdf_b_ngd_grenadier_rpg",
  "rhsgref_cdf_b_ngd_machinegunner",
  "rhsgref_cdf_b_ngd_rifleman",
  "rhsgref_cdf_b_ngd_rifleman_lite",
  "rhsgref_cdf_b_ngd_rifleman_m92",
  "rhsgref_cdf_b_ngd_squadleader"
];

//LOP ==========================================================================
_iaf_des = [
  "LOP_IA_Infantry_Rifleman",
  "LOP_IA_Infantry_SL",
  "LOP_IA_Infantry_TL",
  "LOP_IA_Infantry_Corpsman",
  "LOP_IA_Infantry_MG",
  "LOP_IA_Infantry_AT"
];

_iaf_wdl = [
  "LOP_IA_Infantry_W_Corpsman",
  "LOP_IA_Infantry_W_AT",
  "LOP_IA_Infantry_W_MG",
  "LOP_IA_Infantry_W_Rifleman",
  "LOP_IA_Infantry_W_SL",
  "LOP_IA_Infantry_W_Rifleman"
];

_kur_psh = [
  "LOP_Pesh_Infantry_Corpsman",
  "LOP_PESH_Infantry_AT",
  "LOP_PESH_Infantry_MG",
  "LOP_PESH_Infantry_Rifleman",
  "LOP_PESH_Infantry_TL"
];

_afg_pol = [
  "LOP_AA_Police_Corpsman",
  "LOP_AA_Police_MG",
  "LOP_AA_Police_MG_Asst",
  "LOP_AA_Police_Rifleman_2",
  "LOP_AA_Police_Rifleman",
  "LOP_AA_Police_SL",
  "LOP_AA_Police_TL"
];

_afg_ana = [
  "LOP_AA_Infantry_Corpsman",
  "LOP_AA_Infantry_AT",
  "LOP_AA_Infantry_MG",
  "LOP_AA_Infantry_Rifleman_3",
  "LOP_AA_Infantry_Rifleman",
  "LOP_AA_Infantry_SL",
  "LOP_AA_Infantry_TL"
];

//ARC ==========================================================================
_ger_flk = [
  "ARC_GER_Flecktarn_soldier_AAR",
  "ARC_GER_Flecktarn_soldier_AR",
  "ARC_GER_Flecktarn_medic",
  "ARC_GER_Flecktarn_Soldier_Base",
  "ARC_GER_Flecktarn_light_Soldier_Base",
  "ARC_GER_Flecktarn_soldier_LAT"
];

_ger_trp = [
  "ARC_GER_Tropentarn_soldier_AAR",
  "ARC_GER_Tropentarn_soldier_AR",
  "ARC_GER_Tropentarn_medic",
  "ARC_GER_Tropentarn_Soldier_Base",
  "ARC_GER_Tropentarn_light_Soldier_Base",
  "ARC_GER_Tropentarn_soldier_LAT"
];
