#define CT_STATIC           0
#define ST_PICTURE        0x30

class RscPicture
{
    access = 0;
    idc = -1;
    type = CT_STATIC;
    style = ST_PICTURE;
    colorBackground[] = {0,0,0,0};
    colorText[] = {1,1,1,1};
    font = "PuristaLight";
    sizeEx = 0;
    lineSpacing = 0;
    text = "";
    fixedWidth = 0;
    shadow = 0;
    x = 0;
    y = 0;
    w = 0.2;
    h = 0.15;
};

class RscTitles
{
  class gui_intel_paper_civ_killed
  {
    idd = -1;
    duration = 10;
    name = "gui_intel_paper_civ_killed";
    fadeOut = 5;

    class controls {
      class gui_intel_paper_pic_killed: RscPicture
      {
        idc = -1;
        x = safeZoneX + safeZoneW - 0.3;
        y = safeZoneY + safeZoneH - 1.5;
        w = 0.3;
        h = 0.4;
        text = "data\civ_killed_badge.paa";
      };
    };
  };

  class gui_intel_paper_civ_gunfight
  {
    idd = -1;
    duration = 10;
    name = "gui_intel_paper_civ_gunfight";
    fadeOut = 5;
    onLoad = "with uiNameSpace do { gui_intel_paper_civ_gunfight = _this select 0 }";

    class controls {

      class gui_intel_paper_pic_gunfight: RscPicture
      {
        idc = -1;
        x = safeZoneX + safeZoneW - 0.3;
        y = safeZoneY + safeZoneH - 1.5;
        w = 0.3;
        h = 0.4;
        text = "data\civ_gunfight_badge.paa";
      };
    };
  };
};
