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
  /*
  networking.firewall.extraCommands = ''
    # Allow essential productivity sites
    iptables -A OUTPUT -p tcp --dport 80 -d stackoverflow.com -j ACCEPT
    iptables -A OUTPUT -p tcp --dport 443 -d stackoverflow.com -j ACCEPT
    iptables -A OUTPUT -p tcp --dport 80 -d github.com -j ACCEPT
    iptables -A OUTPUT -p tcp --dport 443 -d github.com -j ACCEPT
    iptables -A OUTPUT -p tcp --dport 80 -d chat.openai.com -j ACCEPT
    iptables -A OUTPUT -p tcp --dport 443 -d chat.openai.com -j ACCEPT
    iptables -A OUTPUT -p tcp --dport 80 -d medium.com -j ACCEPT
    iptables -A OUTPUT -p tcp --dport 443 -d medium.com -j ACCEPT

    # Allow UofT student websites
    iptables -A OUTPUT -p tcp --dport 80 -d utoronto.ca -j ACCEPT
    iptables -A OUTPUT -p tcp --dport 443 -d utoronto.ca -j ACCEPT
    iptables -A OUTPUT -p tcp --dport 80 -d portal.utoronto.ca -j ACCEPT
    iptables -A OUTPUT -p tcp --dport 443 -d portal.utoronto.ca -j ACCEPT
    iptables -A OUTPUT -p tcp --dport 80 -d library.utoronto.ca -j ACCEPT
    iptables -A OUTPUT -p tcp --dport 443 -d library.utoronto.ca -j ACCEPT
    iptables -A OUTPUT -p tcp --dport 80 -d q.utoronto.ca -j ACCEPT
    iptables -A OUTPUT -p tcp --dport 443 -d q.utoronto.ca -j ACCEPT

    # Allow Gmail
    iptables -A OUTPUT -p tcp --dport 80 -d mail.google.com -j ACCEPT
    iptables -A OUTPUT -p tcp --dport 443 -d mail.google.com -j ACCEPT
    iptables -A OUTPUT -p tcp --dport 80 -d gmail.com -j ACCEPT
    iptables -A OUTPUT -p tcp --dport 443 -d gmail.com -j ACCEPT

    # Allow Discord for communication
    iptables -A OUTPUT -p tcp --dport 80 -d discord.com -j ACCEPT
    iptables -A OUTPUT -p tcp --dport 443 -d discord.com -j ACCEPT
    iptables -A OUTPUT -p tcp --dport 80 -d cdn.discordapp.com -j ACCEPT
    iptables -A OUTPUT -p tcp --dport 443 -d cdn.discordapp.com -j ACCEPT
    iptables -A OUTPUT -p tcp --dport 80 -d media.discordapp.net -j ACCEPT
    iptables -A OUTPUT -p tcp --dport 443 -d media.discordapp.net -j ACCEPT

    # Allow Finnish news sites (HS.fi & YLE.fi)
    iptables -A OUTPUT -p tcp --dport 80 -d hs.fi -j ACCEPT
    iptables -A OUTPUT -p tcp --dport 443 -d hs.fi -j ACCEPT
    iptables -A OUTPUT -p tcp --dport 80 -d yle.fi -j ACCEPT
    iptables -A OUTPUT -p tcp --dport 443 -d yle.fi -j ACCEPT

    # Allow Wikipedia for research
    iptables -A OUTPUT -p tcp --dport 80 -d wikipedia.org -j ACCEPT
    iptables -A OUTPUT -p tcp --dport 443 -d wikipedia.org -j ACCEPT

    # Block everything elsew
    iptables -A OUTPUT -p tcp --dport 80 -j REJECT
    iptables -A OUTPUT -p tcp --dport 443 -j REJECT
  '';
  */
}