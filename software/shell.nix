{ config, lib, pkgs, modulesPath, ... }:
{
    programs.zsh = {
      enable=true;
      enableCompletion=true;
      autosuggestions.enable=true;
      shellAliases = {
        config="code /etc/nixos";
        update="sudo nixos-rebuild switch";
        f="firefox";
        gs="git status";
        ga="git add";
        k="kubectl";
      };
  };

}