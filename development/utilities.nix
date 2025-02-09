{ config, lib, pkgs, modulesPath, ... }:
{
  environment.systemPackages = with pkgs; [
      vscode
      git
      postman
      dig
      sqlite
  ];

  virtualisation.docker.enable = false;

  programs.neovim = {
    enable=true;
    defaultEditor=true;
  };
}
