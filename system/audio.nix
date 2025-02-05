{ config, pkgs, ... }:
{
  # Audio
  services.pipewire.enable=true;
  services.pipewire.pulse.enable=true;
  services.pipewire.wireplumber.enable=true; 
}