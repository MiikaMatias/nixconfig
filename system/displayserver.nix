{ config, lib, pkgs, modulesPath, ... }:
{
    services.xserver.enable=true;
    services.xserver.videoDrivers=["nvidia"];
    services.xserver.windowManager.dwm.enable = true;

    # to test if st patch works
    services.picom.enable = true;
}