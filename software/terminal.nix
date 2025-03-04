{config, pkgs, ...} :
{
    environment.systemPackages = with pkgs; [
        st
    ];

    nixpkgs.overlays = [
        (self: super: {
        st = super.st.overrideAttrs (oldAttrs: rec {
            src = fetchGit {
                url = "https://github.com/MiikaMatias/st.git";
            }; 
        });
        })
    ];
    
}