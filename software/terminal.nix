{config, pkgs, ...} :
{
    pkgs.st.override { conf = ./../suckless/st/config.h; };
}