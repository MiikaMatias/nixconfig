{config, pkgs, ...} :
{
    environment.systemPackages = with pkgs; [
        (st.overrideAttrs (oldAttrs: rec {
            src = fetchGit {
                url = "https://github.com/MiikaMatias/st.git";
            }; 
        }))
    ];
        
}