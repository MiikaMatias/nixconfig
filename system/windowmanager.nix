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
                    rev = "3f9bcb78e7bae6db96897b81ca5e18d64f861374";
                }; 
            });
        })
        ]; 
    };
}