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
                    rev = "6fed16031213b8cff2b334125d555ae9453213b0";
                }; 
            });
        })
        ]; 
    };
}