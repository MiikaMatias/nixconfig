{ config, pkgs, ... }:
{
  systemd.timers."dwm-bar" = {
    wantedBy = [ "timers.target" ];
      timerConfig = {
        OnBootSec = "1m";
        OnUnitActiveSec = "1m";
        Unit = "dwm-bar.service";
      };
  };

  systemd.services."dwm-bar" = {
    serviceConfig = {
              ExecStart = "/run/current-system/sw/bin/dwm-status";
        Type = "oneshot";
        User = "root";
    };
  };

  environment.systemPackages = with pkgs; [
    (import ./../suckless/dwm/scripts/dwm-status.nix)
  ];
}   
