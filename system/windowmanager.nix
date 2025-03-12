{ config, pkgs, ... }:
{
    environment.systemPackages = with pkgs; [
        dmenu
        feh
    ];
    services.xserver.windowManager.dwm.enable = true;
    services.xserver.displayManager.defaultSession = "none+dwm";
    nixpkgs = {
        overlays = [
        (self: super: {
            dwm = super.dwm.overrideAttrs (oldattrs: {
                src = fetchGit {
                    url = "https://github.com/MiikaMatias/dwm.git";
                    rev = "9c9ec44a3621b9835281b140179b780118385d84";
                }; 
            });
        })
        ]; 
    };
}