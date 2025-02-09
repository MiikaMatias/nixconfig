{ config, pkgs, ... }:

{
    services.nginx = {
      enable = true;
      virtualHosts."kontrakti.com" = {
        listen = [
          { addr = "0.0.0.0"; port = 8080; ssl = false; }  # Listen on port 8080
        ];
        root = "/home/miika/Projects/portfolio/templates";
        locations."/" = {  
          extraConfig = ''
            index index.html;
          '';
        };
      };
    };
  
  /*
  security.acme = {
    acceptTerms = true;
    defaults.email = "miikapiiparinen24@gmail.com";
    certs."kontrakti.com" = {
      webroot = "/var/lib/acme/acme-challenge";
    };
  };
  */
  
}
