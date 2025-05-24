{config, pkgs, ...} :
{
    
    environment.systemPackages = with pkgs; [
      (st.overrideAttrs (oldAttrs: rec {
          src = fetchFromGitHub {
            owner = "MiikaMatias";
            repo = "st";
            rev = "449306bca4cbf50e87d4d861edd04b77bfeac194";
            sha256="sha256-qV8MMwcmqNMjVIDXTg5mntEhqHk9gOAkS2O5zSIe12M=";
          };
          buildInputs = oldAttrs.buildInputs ++ [ harfbuzz ];
        }))
        xcompmgr
        xclip
    ];

    /* this shit is needed to run alpha patch */
    systemd.services.xcompmgr = {
      wantedBy = [ "graphical.target" ];
      enable = true;
      serviceConfig = {
        User = "miika";
        Environment = "DISPLAY=:0"; 
        ExecStart = "${pkgs.xcompmgr}/bin/xcompmgr";
        Restart = "always";
      };
    };


    programs.zsh = {
      enable=true;
      ohMyZsh = {
        enable = true;
        plugins = [ "git" "sudo" "docker" "kubectl" "zsh-256color"];
      };
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