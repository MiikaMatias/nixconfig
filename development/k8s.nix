{ config, lib, pkgs, modulesPath, ... }:
{
    services.k3s.enable = true;

    environment.systemPackages = with pkgs; [
      k3d
      kubectl
    ];
}