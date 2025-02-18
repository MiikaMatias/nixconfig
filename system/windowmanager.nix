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
                    rev = "f9edc4e3831dac811054a49bcc230bdd4e0e72c8";
                }; 
            });

            installPhase = ''
                mkdir -p $out/bin
                cp $src/scripts/dwm-status $out/bin/dwm-status
                chmod +x $out/bin/dwm-status
            '';
        })
        ]; 
    };
    
    /*
    services.xserver.windowManager.dwm.package = pkgs.dwm.override {
        patches = [
            ./path/to/local.patch
        ];
    };
    */
}