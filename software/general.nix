{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
      gpu-screen-recorder-gtk
      droidcam
      gparted
      kdenlive
      neofetch
      obsidian
      unzip
      wget
      yt-dlp
      lsof
      tree
      ngrok
      gimp
      arduino
      discord
      vlc
      scrcpy
      spotify
      (pkgs.wrapOBS { plugins = with pkgs.obs-studio-plugins; [ wlrobs obs-backgroundremoval obs-pipewire-audio-capture ]; }) 
      gcc
      gnumake
      glibc
    ];

    programs.adb.enable = true;
}