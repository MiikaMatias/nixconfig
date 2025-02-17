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


  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  /*
  services.create_ap = {W
      enable = true;
      settings = {
        INTERNET_IFACE = "eth0";
        WIFI_IFACE = "wlan0";
        SSID = "NIXOS";
        PASSPHRASE = "kurwabober";
      };
  };
  */


  # Here we set up website blocks
  networking.extraHosts = ''
    0.0.0.0 youtube.com
    0.0.0.0 www.youtube.com
    0.0.0.0 m.youtube.com
  '';

}