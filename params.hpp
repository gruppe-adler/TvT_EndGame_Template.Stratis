class Params
{
   class wavesize
   {
      title = "Respawn Wave Size";
      values[] = {0,1,2,3,4,5,6,7,8,9};
      texts[] = {"Automatic", "1", "2","3","4","5","6","7","8","9"};
      default = 0;
   };

   class carriermarker
   {
      title = "Show Carrier Marker on Map";
      values[] = {true, false};
      texts[] = {"Yes", "No"};
      default = false;
   };

   class civiliantraffic
      {
      title = "Civilian Traffic";
      values[] = {0, 1};
      texts[] =  {"False", "True"};
      default = 1;
   };

};
