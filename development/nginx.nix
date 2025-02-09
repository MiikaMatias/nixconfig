{ config, pkgs, ... }:

{
  services.nginx.enable = true;
  services.nginx.virtualHosts."kontrakti.com" = {
      addSSL = true;
      enableACME = true;
      root = "/var/www/kontrakti.com";
  };
  security.acme = {
    acceptTerms = true;
    defaults.email = "foo@bar.com";
  };
}
