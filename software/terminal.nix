{config, pkgs, ...} :
{
    nixpkgs.overlays = [
        (self: super: {
            st = super.st.overrideAttrs (oldattrs: {
                src = fetchGit {
                    url = "https://github.com/MiikaMatias/st.git";
                }; 
            });
        })
    ];
    
}