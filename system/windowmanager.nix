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
                    rev = "af273336c6344a2a4c0691735c83e82e3006fc06";
                }; 
            });
        })
        ]; 
    };

}