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
    script = ''bash ./../suckless/dwm/scripts/dwm-status.bash'';
    serviceConfig = {
        Type = "oneshot";
        User = "root";
    };
  };
}   
