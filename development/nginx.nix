{ config, pkgs, ... }:

{
  services.nginx = {
    enable = true;
    virtualHosts."kontrakti.com" = {
      forceSSL = false;
      enableACME = false;
      locations."/.well-known/acme-challenge/" = {
        root = "/var/lib/acme";
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
