{ config, pkgs, ... }:
{
    environment.systemPackages = with pkgs; [
        dmenu
        st
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
                }; 
            });
        })
        ]; 
    };

}