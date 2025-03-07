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

  systemd.services.monitor-mode = {
    description = "Enable Monitor Mode on Wi-Fi Interface";
    after = [ "network.target" ];
    wantedBy = [ "multi-user.target" ];

    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
      ExecStart = [
        "${pkgs.iproute2}/bin/ip link set wlo1 down"
        "${pkgs.iw}/bin/iw dev wlo1 set type monitor"
        "${pkgs.iproute2}/bin/ip link set wlo1 up"
      ];
    };
  };

}