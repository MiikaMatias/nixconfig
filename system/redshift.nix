{config, pkgs, ...}: 
{
  services.redshift = {
    enable = true;
    brightness = {
      day = "1";
      night = "0.6";
    };
    temperature = {
      day = 4500;
      night = 2700;
    };
  };
}