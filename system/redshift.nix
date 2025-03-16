{config, pkgs, ...}: 
{
  services.redshift = {
    enable = true;
    brightness = {
      day = "1";
      night = "1";
    };
    temperature = {
      day = 4500;
      night = 4500;
    };
  };
}