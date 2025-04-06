{config, lib, pkgs, ...}:
{
    environment.systemPackages = [
        pkgs.godot_4
        pkgs.jdk17
        pkgs.android-studio
    ];

    # Installing android here since using it for gamedev
    nixpkgs.config = {
      android_sdk.accept_license = true;
    };
}