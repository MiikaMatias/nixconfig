{ config, pkgs, ... }:
{  
  programs.firefox = {
      enable = true;
  };

<<<<<<< Updated upstream
  environment.systemPackages = with pkgs ; [ 
=======
  environment.systemPackages = with pkgs; [
>>>>>>> Stashed changes
      w3m
  ];
}