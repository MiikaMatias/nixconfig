{ config, pkgs, ... }:
{  
  programs.firefox = {
      enable = true;
  };

  environment.systemPackages = with pkgs ; [ 
      w3m
  ];
}