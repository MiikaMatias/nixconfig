{ config, pkgs, ... }:
{
  # Audio
  sound.enable=true;
  services.pipewire.enable=true;
  services.pipewire.pulse.enable=true;
  services.pipewire.wireplumber.enable=true; 
}