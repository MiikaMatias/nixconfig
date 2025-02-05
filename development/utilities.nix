{ config, lib, pkgs, modulesPath, ... }:
{
  environment.systemPackages = with pkgs; [
      vscode
      git
      postman
      sqlite
  ];

  virtualisation.docker.enable = true;

  programs.neovim = {
    enable=true;
    defaultEditor=true;
  };
}
