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
                    rev = "e29b402a908c526062da346c9d52712adb2322cb";
                }; 
            });
        })
        ]; 
    };
}