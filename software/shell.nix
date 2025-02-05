{ config, lib, pkgs, modulesPath, ... }:
{
    programs.zsh = {
      enable=true;
      enableCompletion=true;
      autosuggestions.enable=true;
      shellAliases = {
        config="code /etc/nixos";
        update="git add /etc/nixos/. && git commit -m \"flakes rebuild $(date '+%Y-%m-%d %H:%M:%S')\" && git push && sudo nixos-rebuild switch --flake . --impure"
        f="firefox";
        gs="git status";
        ga="git add";
        k="kubectl";
      };
  };

}