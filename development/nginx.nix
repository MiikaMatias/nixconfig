{ config, pkgs, ... }:

{
  services.nginx = {
    enable = true;
    virtualHosts."kontrakti.com" = {
      forceSSL = false;
      enableACME = false;
    };
  };

  /*
  security.acme = {
    acceptTerms = true;
    defaults.email = "your@email.com";  # Replace with your email
    certs."yourdomain.com" = {
      webroot = "/var/lib/acme/acme-challenge"; # Directory for the challenge
    };
  };
  */
}
