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

  services.blocky = {
    enable = true;
    settings = {
      ports.dns = 53; # Port for incoming DNS Queries.
      upstreams.groups.default = [
        "https://one.one.one.one/dns-query" # Using Cloudflare's DNS over HTTPS server for resolving queries.
      ];
      # For initially solving DoH/DoT Requests when no system Resolver is available.
      bootstrapDns = {
        upstream = "https://one.one.one.one/dns-query";
        ips = [ "1.1.1.1" "1.0.0.1" ];
      };
      #Enable Blocking of certian domains.
      blocking = {
        blackLists = {
          #Adblocking
          ads = ["https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts"];
          #Another filter for blocking adult sites
          adult = ["https://blocklistproject.github.io/Lists/porn.txt"];
          #You can add additional categories
        };
        #Configure what block categories are used
        clientGroupsBlock = {
          default = [ "ads" ];
          kids-ipad = ["ads" "adult"];
        };
      };
    };
  };

}