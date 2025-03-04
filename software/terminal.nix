{config, pkgs, ...} :
{
    
    environment.systemPackages = with pkgs; [
      (st.overrideAttrs (oldAttrs: rec {
          src = fetchFromGitHub {
            owner = "LukeSmithxyz";
            repo = "st";
            rev = "8ab3d03681479263a11b05f7f1b53157f61e8c3b";
            sha256 = "1brwnyi1hr56840cdx0qw2y19hpr0haw4la9n0rqdn0r2chl8vag";
          };
          buildInputs = oldAttrs.buildInputs ++ [ harfbuzz ];
        }))
    ];

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