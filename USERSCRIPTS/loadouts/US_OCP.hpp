class US_OCP {
    class AllUnits {
        binoculars = "Binocular";
        map = "ItemMap";
        gps = "ItemGPS";
        radio = "tf_anprc152";
        compass = "ItemCompass";
        watch = "ItemWatch";
        nvgoggles = "";
    };

    class Type {
        //rifleman
        class Soldier_F {
            primaryWeapon = "rhs_weap_m4a1_carryhandle";
        	primaryWeaponOptics = "rhsusf_acc_compm4";
        	handgunWeapon = "rhsusf_weap_m9";
        	uniform = "rhs_uniform_cu_ocp";
        	addItemsToUniform[] = {LIST_10("ACE_fieldDressing"),LIST_4("ACE_morphine"),"ACE_epinephrine","ACE_MapTools",LIST_2("ACE_CableTie")};
        	vest = "rhsusf_iotv_ocp_Rifleman";
        	addItemsToVest[] = {"rhsusf_mag_15Rnd_9x19_JHP",LIST_4("rhs_mag_an_m8hc"),LIST_2("rhs_mag_m67"),LIST_9("rhs_mag_30Rnd_556x45_Mk262_Stanag")};
        	headgear = "rhsusf_ach_helmet_headset_ocp";
        };

        //squadleader
        class Soldier_SL_F {
        	primaryWeapon = "rhs_weap_m4a1_carryhandle";
        	primaryWeaponOptics = "rhsusf_acc_compm4";
        	handgunWeapon = "rhsusf_weap_m9";
        	uniform = "rhs_uniform_cu_ocp";
        	addItemsToUniform[] = {LIST_10("ACE_fieldDressing"),LIST_4("ACE_morphine"),"ACE_epinephrine","ACE_MapTools",LIST_2("ACE_CableTie")};
        	vest = "rhsusf_iotv_ocp_Squadleader";
        	addItemsToVest[] = {"rhsusf_mag_15Rnd_9x19_JHP",LIST_9("rhs_mag_30Rnd_556x45_Mk262_Stanag"),LIST_2("rhs_mag_an_m8hc"),LIST_2("rhs_mag_m67"),"SmokeShellBlue","SmokeShellGreen","SmokeShellOrange","SmokeShellPurple","SmokeShellRed"};
        	backpack = "tf_rt1523g_big_rhs";
        	addItemsToBackpack[] = {};
        	headgear = "rhsusf_ach_helmet_headset_ocp";
        };

        //teamleader
        class Soldier_TL_F {
        	primaryWeapon = "rhs_weap_m4a1_carryhandle";
        	primaryWeaponOptics = "rhsusf_acc_compm4";
        	handgunWeapon = "rhsusf_weap_m9";
        	uniform = "rhs_uniform_cu_ocp";
        	addItemsToUniform[] = {LIST_10("ACE_fieldDressing"),LIST_4("ACE_morphine"),"ACE_epinephrine","ACE_MapTools",LIST_2("ACE_CableTie")};
        	vest = "rhsusf_iotv_ocp_Teamleader";
        	addItemsToVest[] = {"rhsusf_mag_15Rnd_9x19_JHP",LIST_9("rhs_mag_30Rnd_556x45_Mk262_Stanag"),LIST_2("rhs_mag_an_m8hc"),LIST_2("rhs_mag_m67"),"SmokeShellBlue","SmokeShellGreen","SmokeShellOrange","SmokeShellPurple","SmokeShellRed"};
        	backpack = "tf_rt1523g_big_rhs";
        	addItemsToBackpack[] = {};
        	headgear = "rhsusf_ach_helmet_headset_ocp";
        };

        //MG
        class soldier_AR_F {
        	primaryWeapon = "rhs_weap_m249_pip_L_vfg";
        	uniform = "rhs_uniform_cu_ocp";
        	addItemsToUniform[] = {LIST_10("ACE_fieldDressing"),LIST_4("ACE_morphine"),"ACE_epinephrine","ACE_MapTools",LIST_2("ACE_CableTie")};
        	vest = "rhsusf_iotv_ocp_SAW";
        	addItemsToVest[] = {LIST_2("rhs_mag_an_m8hc"),LIST_2("rhs_mag_m67"),LIST_2("rhsusf_100Rnd_556x45_M200_soft_pouch")};
        	backpack = "rhsusf_assault_eagleaiii_ocp";
        	addItemsToBackpack[] = {LIST_2("rhs_200rnd_556x45_M_SAW")};
        	headgear = "rhsusf_ach_helmet_headset_ocp";
        };

        //MG ass.
        class soldier_AAR_F {
        	primaryWeapon = "rhs_weap_m4a1_carryhandle";
        	primaryWeaponOptics = "rhsusf_acc_compm4";
        	handgunWeapon = "rhsusf_weap_m9";
        	uniform = "rhs_uniform_cu_ocp";
        	addItemsToUniform[] = {LIST_10("ACE_fieldDressing"),LIST_4("ACE_morphine"),"ACE_epinephrine","ACE_MapTools",LIST_2("ACE_CableTie")};
        	vest = "rhsusf_iotv_ocp_Squadleader";
        	addItemsToVest[] = {"rhsusf_mag_15Rnd_9x19_JHP",LIST_4("rhs_mag_an_m8hc"),LIST_2("rhs_mag_m67"),LIST_9("rhs_mag_30Rnd_556x45_Mk262_Stanag")};
        	backpack = "rhsusf_assault_eagleaiii_ocp";
        	addItemsToBackpack[] = {LIST_2("rhs_200rnd_556x45_M_SAW"),"rhsusf_100Rnd_556x45_soft_pouch"};
        	headgear = "rhsusf_ach_helmet_headset_ocp";
        };

        //AT
        class soldier_LAT_F {
        	primaryWeapon = "rhs_weap_m4a1_carryhandle";
        	primaryWeaponOptics = "rhsusf_acc_compm4";
        	secondaryWeapon = "rhs_weap_M136";
        	handgunWeapon = "rhsusf_weap_m9";
        	uniform = "rhs_uniform_cu_ocp";
        	addItemsToUniform[] = {LIST_10("ACE_fieldDressing"),LIST_4("ACE_morphine"),"ACE_epinephrine","ACE_MapTools",LIST_2("ACE_CableTie")};
        	vest = "rhsusf_iotv_ocp_Rifleman";
        	addItemsToVest[] = {"rhsusf_mag_15Rnd_9x19_JHP",LIST_4("rhs_mag_an_m8hc"),LIST_2("rhs_mag_m67"),LIST_9("rhs_mag_30Rnd_556x45_Mk262_Stanag")};
        	headgear = "rhsusf_ach_helmet_headset_ocp";
        };

        //medic
        class medic_F {
        	primaryWeapon = "rhs_weap_m4a1_carryhandle";
        	primaryWeaponOptics = "rhsusf_acc_compm4";
        	handgunWeapon = "rhsusf_weap_m9";
        	uniform = "rhs_uniform_cu_ocp";
        	addItemsToUniform[] = {LIST_10("ACE_fieldDressing"),LIST_4("ACE_morphine"),"ACE_epinephrine","ACE_MapTools",LIST_2("ACE_CableTie")};
        	vest = "rhsusf_iotv_ocp_Squadleader";
        	addItemsToVest[] = {"rhsusf_mag_15Rnd_9x19_JHP",LIST_10("rhs_mag_an_m8hc"),LIST_2("rhs_mag_m67"),LIST_9("rhs_mag_30Rnd_556x45_Mk262_Stanag")};
        	backpack = "rhsusf_assault_eagleaiii_ocp";
        	addItemsToBackpack[] = {LIST_40("ACE_fieldDressing"),LIST_30("ACE_morphine"),LIST_20("ACE_epinephrine"),LIST_5("ACE_bloodIV_500")};
        	headgear = "rhsusf_ach_helmet_headset_ocp";
        };

        //grenadier
        class Soldier_GL_F {
        	primaryWeapon = "rhs_weap_m4a1_m203";
        	primaryWeaponOptics = "rhsusf_acc_compm4";
        	handgunWeapon = "rhsusf_weap_m9";
        	uniform = "rhs_uniform_cu_ocp";
        	addItemsToUniform[] = {LIST_10("ACE_fieldDressing"),LIST_4("ACE_morphine"),"ACE_epinephrine","ACE_MapTools",LIST_2("ACE_CableTie")};
        	vest = "rhsusf_iotv_ocp_Grenadier";
        	addItemsToVest[] = {"rhsusf_mag_15Rnd_9x19_JHP",LIST_4("rhs_mag_m67"),LIST_9("rhs_mag_30Rnd_556x45_Mk262_Stanag"),LIST_5("1Rnd_Smoke_Grenade_shell")};
        	headgear = "rhsusf_ach_helmet_headset_ocp";
        };
    };
};
