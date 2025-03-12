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
        ExecStart="${pkgs.screen}/bin/bash /etc/nixos/suckless/dwm/scripts/dwm-status.bash";
        Type = "oneshot";
        User = "root";
    };
  };
}   
