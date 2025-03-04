{ config, lib, pkgs, modulesPath, ... }:
{
    services.xserver.enable=true;
    services.xserver.videoDrivers=["nvidia"];
    services.xserver.windowManager.dwm.enable = true;
}