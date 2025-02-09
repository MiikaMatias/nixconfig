{ config, lib, pkgs, modulesPath, ... }:
{
  networking.networkmanager.enable = true;
  networking.firewall.allowedTCPPorts = [ 80 443 ];
  boot.kernel.sysctl."net.ipv4.ip_unprivileged_port_start" = 0;
  boot.kernel.sysctl."net.ipv6.ip_unprivileged_port_start" = 0;
  networking.hostName = "schworshp";
  networking.nat.enableIPv6 = true;
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

}