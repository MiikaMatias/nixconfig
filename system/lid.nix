{ config, lib, pkgs, modulesPath, ... }:
{
    services.logind = {
        lidSwitch = "ignore";
        lidSwitchDocked = "ignore";
        lidSwitchExternalPower = "ignore";
    };
}