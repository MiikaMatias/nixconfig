{config, lib, pkgs, ...}:
{
    environment.systemPackages = [
        pkgs.godot_4
        pkgs.jdk17
    ];

    # Installing android here
}