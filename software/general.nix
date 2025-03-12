{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
      gpu-screen-recorder-gtk
      droidcam
      gparted
      neofetch
      obsidian
      unzip
      sshpass
      wireshark
      iw
      wget
      yt-dlp
      tmux
      scrot
      lsof
      tree
      ngrok
      kdePackages.kdenlive
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