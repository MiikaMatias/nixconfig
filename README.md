# nixconfig
My daily driver nix configuration. I use flakes and have a pretty simple design philosophy for my configuration. I have stuff segregated into importable files in specific directories. Nixpkgs version defined in the top level flake file. I also have some handy aliases defined in `shell.nix`:

```
        config="code /etc/nixos";
        update="gpr && sudo nixos-rebuild switch --flake . --impure && ga /etc/nixos/. && gc -m \"flakes rebuild $(date '+%Y-%m-%d %H:%M:%S') \n Changes: $(git diff --name-only --staged | tr '\n' ' ')\" && gp";
        gs="git status";
        ga="git add";
        gp="git push";
        gc="git commit";
        gpr="git pull --rebase";

```

these allow me to just pull up my configuration via `config` and then update it with `update` after doing useful changes. 