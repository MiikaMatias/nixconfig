{ config, pkgs, ... }:
{
  services.cron = {
    enable = true;
    systemCronJobs = [
      "*/5 * * * *      root    date >> /tmp/cron.log"
      "*/1 * * * *      root    bash /etc/nixos/suckless/dwm/scripts/dwm-status"
    ];
  };
}