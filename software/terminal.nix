{config, pkgs, ...} :
{

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