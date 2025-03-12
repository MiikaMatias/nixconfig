{ config, pkgs, ... }:
{
  services.cron = {
    enable = true;
    systemCronJobs = [
      "*/5 * * * *      root    date >> /tmp/cron.log"
      "* * * * *        root    dwm-status"
    ];
  };
}   
