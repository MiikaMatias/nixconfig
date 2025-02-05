{ config, lib, pkgs, modulesPath, ... }:
{
   virtualisation.virtualbox.host.enable = true;
   users.extraGroups.vboxusers.members = [ "miika" ];
}