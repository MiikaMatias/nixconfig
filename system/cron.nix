{ config, pkgs, ... }:
{
  services.cron = {
    enable = true;
    systemCronJobs = [
      "*/5 * * * *   date >> /tmp/cron.log"
      "* * * * *     bash /etc/nixos/suckless/dwm/scripts/dwm-status"
    ];
  };
}