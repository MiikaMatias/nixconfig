{ config, lib, pkgs, modulesPath, ... }:
{
    programs.zsh = {
      enable=true;
      enableCompletion=true;
      autosuggestions.enable=true;
      shellAliases = {
        config="code /etc/nixos";
        update="sudo nixos-rebuild switch --flake . --impure && git add /etc/nixos/. && git commit -m \"flakes rebuild $(date '+%Y-%m-%d %H:%M:%S') \n Changes: $(git diff --name-only --staged | tr '\n' ' ')\" && git push";
        f="firefox";
        gs="git status";
        ga="git add";
        k="kubectl";
      };
  };

}