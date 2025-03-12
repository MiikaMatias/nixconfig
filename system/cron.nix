{ config, pkgs, ... }:
{
  services.cron = {
    enable = true;
    systemCronJobs = [
      "*/5 * * * *      root    date >> /tmp/cron.log"
      "* * * * *        miika    update-dwm-bar"
    ];
  };
}   
