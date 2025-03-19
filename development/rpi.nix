{config, lib, pkgs, ...}:
{
    environment.systemPackages = [
        pkgs.rpi-imager
    ];
}