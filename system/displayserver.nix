{ config, lib, pkgs, modulesPath, ... }:
{
    # Enable X server (for compatibility, though Hyprland runs on Wayland)
    services.xserver.enable = true;
    services.xserver.videoDrivers = [ "nvidia" ];

    # Enable Hyprland
    programs.hyprland.enable = true;

    # Install necessary dependencies
    environment.systemPackages = with pkgs; [
        hyprland
        xdg-desktop-portal-hyprland
        waybar  # Status bar
        rofi-wayland  # App launcher
        wl-clipboard  # Clipboard support
        mako  # Notifications
        grim slurp  # Screenshots
        swww  # Wallpaper support
        kitty  # Terminal emulator
    ];

    # Set Hyprland as the default session
    services.displayManager.defaultSession = "hyprland";
}
