{ config, lib, pkgs, modulesPath, ... }:
{
    services.xserver.enable=true;
    services.xserver.videoDrivers=["nvidia"];
}