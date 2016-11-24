class RU_EMR {
    class AllUnits {
        binoculars = "Binocular";
        map = "ItemMap";
        gps = "ItemGPS";
        radio = "tf_fadak";
        compass = "ItemCompass";
        watch = "ItemWatch";
        nvgoggles = "";
    };

    class Type {
        //rifleman
        class Soldier_F {
            primaryWeapon = "rhs_weap_ak105";
        	primaryWeaponMuzzle = "rhs_acc_dtk";
        	primaryWeaponPointer = "rhs_acc_2dpZenit";
        	primaryWeaponOptics = "rhs_acc_pkas";
        	uniform = "rhs_uniform_vdv_emr";
        	addItemsToUniform[] = {LIST_12("ACE_fieldDressing"),LIST_2("ACE_CableTie"),"ACE_epinephrine",LIST_5("ACE_morphine"),LIST_2("rhs_mag_rdg2_white")};
        	vest = "rhs_6b23_digi_vydra_3m";
        	addItemsToVest[] = {LIST_9("rhs_30Rnd_545x39_AK"),LIST_2("rhs_mag_rgo")};
        	headgear = "rhs_6b27m_green";
        };

        //squadleader
        class Soldier_SL_F {
        	primaryWeapon = "rhs_weap_ak105";
        	primaryWeaponMuzzle = "rhs_acc_dtk";
        	primaryWeaponPointer = "rhs_acc_2dpZenit";
        	primaryWeaponOptics = "rhs_acc_pkas";
        	uniform = "rhs_uniform_vdv_emr";
        	addItemsToUniform[] = {LIST_12("ACE_fieldDressing"),LIST_2("ACE_CableTie"),"ACE_epinephrine",LIST_5("ACE_morphine")};
        	vest = "rhs_6b23_digi_6sh92_radio";
        	addItemsToVest[] = {LIST_9("rhs_30Rnd_545x39_AK")};
        	backpack = "tf_mr3000_rhs";
        	addItemsToBackpack[] = {LIST_6("rhs_mag_rdg2_white"),LIST_2("rhs_mag_rgn")};
        	headgear = "rhs_6b27m_green_ess";
        };

        //teamleader
        class Soldier_TL_F {
        	primaryWeapon = "rhs_weap_ak105";
        	primaryWeaponMuzzle = "rhs_acc_dtk";
        	primaryWeaponPointer = "rhs_acc_2dpZenit";
        	primaryWeaponOptics = "rhs_acc_pkas";
        	uniform = "rhs_uniform_vdv_emr";
        	addItemsToUniform[] = {LIST_12("ACE_fieldDressing"),LIST_2("ACE_CableTie"),"ACE_epinephrine",LIST_5("ACE_morphine")};
        	vest = "rhs_6b23_digi_6sh92_radio";
        	addItemsToVest[] = {LIST_9("rhs_30Rnd_545x39_AK")};
        	backpack = "tf_mr3000_rhs";
        	addItemsToBackpack[] = {LIST_6("rhs_mag_rdg2_white"),LIST_2("rhs_mag_rgn")};
        	headgear = "rhs_6b27m_green_ess";
        };

        //MG
        class soldier_AR_F {
        	primaryWeapon = "rhs_weap_pkp";
        	uniform = "rhs_uniform_vdv_emr";
        	addItemsToUniform[] = {LIST_12("ACE_fieldDressing"),LIST_2("ACE_CableTie"),"ACE_epinephrine",LIST_5("ACE_morphine")};
        	vest = "rhs_6b23_digi_6sh92_headset";
        	addItemsToVest[] = {LIST_2("rhs_mag_rdg2_white"),LIST_2("rhs_mag_rgn"),"rhs_100Rnd_762x54mmR"};
        	backpack = "rhs_assault_umbts";
        	addItemsToBackpack[] = {LIST_3("rhs_100Rnd_762x54mmR")};
        	headgear = "rhs_6b27m_green_bala";
        };

        //MG ass.
        class soldier_AAR_F {
        	primaryWeapon = "rhs_weap_ak105";
        	primaryWeaponMuzzle = "rhs_acc_dtk";
        	primaryWeaponPointer = "rhs_acc_2dpZenit";
        	primaryWeaponOptics = "rhs_acc_pkas";
        	uniform = "rhs_uniform_vdv_emr";
        	addItemsToUniform[] = {LIST_12("ACE_fieldDressing"),LIST_2("ACE_CableTie"),"ACE_epinephrine",LIST_5("ACE_morphine")};
        	vest = "rhs_6b23_digi_6sh92";
        	addItemsToVest[] = {LIST_8("rhs_30Rnd_545x39_AK")};
        	backpack = "rhs_assault_umbts";
        	addItemsToBackpack[] = {LIST_2("rhs_mag_rgn"),LIST_4("rhs_mag_rdg2_white"),LIST_2("rhs_100Rnd_762x54mmR")};
        	headgear = "rhs_6b27m_green";
        };

        //AT
        class soldier_LAT_F {
        	primaryWeapon = "rhs_weap_ak105";
        	primaryWeaponMuzzle = "rhs_acc_dtk";
        	primaryWeaponPointer = "rhs_acc_2dpZenit";
        	primaryWeaponOptics = "rhs_acc_pkas";
        	secondaryWeapon = "rhs_weap_rpg7";
        	uniform = "rhs_uniform_vdv_emr";
        	addItemsToUniform[] = {LIST_12("ACE_fieldDressing"),LIST_2("ACE_CableTie"),"ACE_epinephrine",LIST_5("ACE_morphine")};
        	vest = "rhs_6b23_digi_vydra_3m";
        	addItemsToVest[] = {LIST_9("rhs_30Rnd_545x39_AK")};
        	backpack = "rhs_assault_umbts";
        	addItemsToBackpack[] = {"rhs_rpg7_PG7VL_mag",LIST_4("rhs_mag_rdg2_white"),LIST_2("rhs_mag_rgn")};
        	headgear = "rhs_6b27m_green";
        };

        //medic
        class medic_F {
        	primaryWeapon = "rhs_weap_ak105";
        	primaryWeaponMuzzle = "rhs_acc_dtk";
        	primaryWeaponPointer = "rhs_acc_2dpZenit";
        	primaryWeaponOptics = "rhs_acc_pkas";
        	uniform = "rhs_uniform_vdv_emr";
        	addItemsToUniform[] = {LIST_12("ACE_fieldDressing"),LIST_2("ACE_CableTie"),"ACE_epinephrine",LIST_5("ACE_morphine")};
        	vest = "rhs_6b23_digi_medic";
        	addItemsToVest[] = {LIST_8("rhs_30Rnd_545x39_AK"),"rhs_mag_rgn"};
        	backpack = "rhs_assault_umbts";
        	addItemsToBackpack[] = {LIST_40("ACE_fieldDressing"),LIST_10("ACE_epinephrine"),LIST_20("ACE_morphine"),LIST_5("ACE_bloodIV_500"),LIST_6("rhs_mag_rdg2_white")};
        	headgear = "rhs_6b27m_green";
        };

        //grenadier
        class Soldier_GL_F {
        	primaryWeapon = "rhs_weap_ak74m_gp25";
        	primaryWeaponMuzzle = "rhs_acc_dtk";
        	primaryWeaponOptics = "rhs_acc_pkas";
        	handgunWeapon = "hgun_Rook40_F";
        	uniform = "rhs_uniform_vdv_emr";
        	addItemsToUniform[] = {LIST_12("ACE_fieldDressing"),LIST_2("ACE_CableTie"),"ACE_epinephrine",LIST_5("ACE_morphine")};
        	vest = "rhs_6b23_digi_6sh92_vog";
        	addItemsToVest[] = {LIST_2("rhs_mag_rgn"),LIST_9("rhs_30Rnd_545x39_AK"),LIST_2("rhs_mag_rgo")};
        	backpack = "rhs_assault_umbts";
        	addItemsToBackpack[] = {LIST_4("rhs_mag_rdg2_white"),LIST_4("rhs_GRD40_White"),LIST_4("rhs_GRD40_Red")};
        	headgear = "rhs_6b27m_green";
        };
    };
};
