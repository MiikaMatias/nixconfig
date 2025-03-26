{ config, lib, pkgs, modulesPath, ... }:
{
  networking.networkmanager.enable = true;
  networking.firewall.allowedTCPPorts = [ 80 443 ];
  networking.hostName = "schworshp";

  networking.firewall.enable = true;

  security.sudo.extraRules = [
    {
      users = [ "miika" ]; 
      commands = [
        { command = "/bin/ip"; options = [ "NOPASSWD" ]; }
        { command = "/bin/iw"; options = [ "NOPASSWD" ]; }
      ];
    }
  ];

 
}