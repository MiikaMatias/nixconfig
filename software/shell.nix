{ config, lib, pkgs, modulesPath, ... }:
{
    programs.zsh = {
      enable=true;
      enableCompletion=true;
      autosuggestions.enable=true;
      shellAliases = {
        config="code /etc/nixos";
        update="git stash && gpr && git stash pop && sudo nixos-rebuild switch --flake path:.  --impure && ga /etc/nixos/. && gc -m \"flakes rebuild $(date '+%Y-%m-%d %H:%M:%S') \n Changes: $(git diff --name-only --staged | tr '\n' ' ')\" && gp";
        gs="git status";
        ga="git add";
        gp="git push";
        gc="git commit";
        gpr="git pull --rebase";
        f="firefox";
        k="kubectl";
      };
  };

}