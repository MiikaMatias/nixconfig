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
                    rev = "8e596171f2ba6bf1f9f7aa155aba33d93ad0ebe9";
                }; 
            });
        })
        ]; 
    };
}