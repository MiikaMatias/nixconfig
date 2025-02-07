{ config, pkgs, ... }:

{
  services.nginx = {
    enable = true;
    virtualHosts = {
      "kontrakti.com" = {  #
        forceSSL = true;  
        enableACME = true; 
        root = "/home/miika/www/kontrakti.com";
        locations."/" = {
          proxyPass = "http://localhost:8080"; 
        };
        locations."/static/" = {
          root = "/home/user/project/templates";
        };
      };
    };
  };

  security.acme = {
    acceptTerms = true;
    defaults.email = "miikapiiparinen24@gmail.com";
  };

  networking.firewall.allowedTCPPorts = [ 80 443 ];
}
