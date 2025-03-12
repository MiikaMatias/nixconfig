{ config, pkgs, ... }:
{
  systemd.timers."dwm-bar" = {
    wantedBy = [ "timers.target" ];
      timerConfig = {
        OnBootSec = "1m";
        OnUnitActiveSec = "1s";
        Unit = "dwm-bar.service";
        persistent = true;
      };
  };

  systemd.services."dwm-bar" = {
    serviceConfig = {
        Environment = [
          "DISPLAY=:0"
          "XAUTHORITY=/home/miika/.Xauthority"
        ];
        ExecStart = "/run/current-system/sw/bin/dwm-status";
        Type = "oneshot";
        User = "miika";
    };
  };

  environment.systemPackages = with pkgs; [
    (import ./../suckless/dwm/scripts/dwm-status.nix)
  ];
}   
