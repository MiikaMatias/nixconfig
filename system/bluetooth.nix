{ config, pkgs, ... }:
{

  environment.systemPackages = with pkgs; [
      bluetoothctl
  ];
}