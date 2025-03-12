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
}   
