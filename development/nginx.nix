{config, lib, pkgs, modulesPath, ...}:
{
  services.nginx = {
        enable = true;
        virtualHosts."kontrakti.com" = {
            forceSSL = true;
            enableACME = true;
            locations."/" = {
                proxyPass = "http://localhost:8000";
                proxyWebSockets = true;
            };
            locations."/static/" = {
                root = "/home/miika/Projects/portfolio/templates";  # Serve static files
            };
        };
    };

  security.acme = {
    acceptTerms = true;
    defaults.email = "your-email@example.com";
  };

  networking.firewall.allowedTCPPorts = [ 80 443 ];
}