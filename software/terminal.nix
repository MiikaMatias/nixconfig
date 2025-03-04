{config, pkgs, ...} :
{
    
    environment.systemPackages = with pkgs; [
      (st.overrideAttrs (oldAttrs: rec {
          src = fetchFromGitHub {
            owner = "MiikaMatias";
            repo = "st";
            rev = "dd982c4d943939286acccc18ce3519abe21063fa";
            sha256="sha256-zGEEIG4YbT/nUclmEF80XYxft3BXNl1QODyXmxe4jkY=";
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