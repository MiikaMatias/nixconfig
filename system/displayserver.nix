{ config, lib, pkgs, modulesPath, ... }:
{
    # We use x11 and need startx to start plasma
    services.xserver.enable=true;
    services.xserver.videoDrivers=["nvidia"];
    services.displayManager.sddm.enable=true;
    services.displayManager.sddm.wayland.enable=true;
    services.desktopManager.plasma6.enable=true;
}