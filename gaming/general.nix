{ config, lib, pkgs, modulesPath, ... }:
{
    environment.systemPackages = with pkgs; [
        prismlauncher
        krita
    ];

    services.logind = {
        lidSwitch = "ignore";
        lidSwitchDocked = "ignore";
        lidSwitchExternalPower = "ignore";
    };
}