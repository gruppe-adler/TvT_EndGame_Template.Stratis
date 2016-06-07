// tfarSettings.sqf

if (isNil "AUTOMATICRADIOS") then {
  TF_give_microdagr_to_soldier = false;
  TF_give_personal_radio_to_regular_soldier = false;
  tf_no_auto_long_range_radio = true;
} else {
  if (AUTOMATICRADIOS) then {
    TF_give_microdagr_to_soldier = true;
    TF_give_personal_radio_to_regular_soldier = true;
    tf_no_auto_long_range_radio = false;
  } else {
    TF_give_microdagr_to_soldier = false;
    TF_give_personal_radio_to_regular_soldier = false;
    tf_no_auto_long_range_radio = true;
  };
};

publicVariable "TF_give_microdagr_to_soldier";
publicVariable "TF_give_personal_radio_to_regular_soldier";
publicVariable "tf_no_auto_long_range_radio";


if (isNil "BLUFORSWRADIO") then {
  TF_defaultWestRiflemanRadio = "tf_anprc152";
  TF_defaultWestPersonalRadio = "tf_anprc152";
} else {
  TF_defaultWestRiflemanRadio = BLUFORSWRADIO;
  TF_defaultWestPersonalRadio = BLUFORSWRADIO;
};

if (isNil "OPFORSWRADIO") then {
  TF_defaultEastRiflemanRadio = "tf_fadak";
  TF_defaultEastPersonalRadio = "tf_fadak";
} else {
  TF_defaultEastRiflemanRadio = OPFORSWRADIO;
  TF_defaultEastPersonalRadio = OPFORSWRADIO;
};

if (isNil "BLUFORLRRADIO") then {
  TF_defaultWestBackpack = "tf_rt1523g_big_rhs";
} else {
  TF_defaultWestBackpack = BLUFORLRRADIO;
};

if (isNil "OPFORLRRADIO") then {
  TF_defaultEastBackpack = "tf_mr3000_rhs";
} else {
  TF_defaultEastBackpack = OPFORLRRADIO;
};

publicVariable "TF_defaultWestRiflemanRadio";
publicVariable "TF_defaultWestPersonalRadio";
publicVariable "TF_defaultEastRiflemanRadio";
publicVariable "TF_defaultEastPersonalRadio";
publicVariable "TF_defaultWestBackpack";
publicVariable "TF_defaultEastBackpack";


tf_same_lr_frequencies_for_side = true;
tf_same_sw_frequencies_for_side = true;
TF_terrain_interception_coefficient = 6.0;

publicVariable "tf_same_lr_frequencies_for_side";
publicVariable "tf_same_sw_frequencies_for_side";
publicVariable "TF_terrain_interception_coefficient";
