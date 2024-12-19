{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
      wget
      unzip
      droidcam
      (pkgs.wrapOBS {
      plugins = with pkgs.obs-studio-plugins; [
          wlrobs
          obs-backgroundremoval
         obs-pipewire-audio-capture
        ];
      })
      kdenlive
      neofetch
      gparted
  ];
}