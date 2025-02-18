{ config, pkgs, ... }:
{
    environment.systemPackages = with pkgs; [
        dmenu
        st
        feh
    ];
    services.xserver.windowManager.dwm.enable = true;
    services.xserver.displayManager.defaultSession = "none+dwm";
    services.xserver.windowManager.dwm.package = pkgs.dwm.overrideAttrs {
        src = ./suckless/dwm;
    };

    /*
    services.xserver.windowManager.dwm.package = pkgs.dwm.override {
        patches = [
            ./path/to/local.patch
        ];
    };
    */
}