{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    droidcam
    gparted
    kdenlive
    neofetch
    obsidian
    unzip
    wget
    yt-dlp
    ngrok
    (pkgs.wrapOBS { plugins = with pkgs.obs-studio-plugins; [ wlrobs obs-backgroundremoval obs-pipewire-audio-capture ]; })  ];
}