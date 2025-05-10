{config, pkgs, ...}: 
{
  services.redshift = {
    enable = true;
    brightness = {
      day = "1";
      night = "1";
    };
    temperature = {
      day = 2500;
      night = 2500;
    };
  };
}