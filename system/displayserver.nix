{ config, lib, pkgs, modulesPath, ... }:
{
    # We use x11 and need startx to start plasma
    services.xserver.enable=true;
    services.xserver.videoDrivers=["nvidia"];

    services.xserver.windowManager.dwm.enable = true;
}