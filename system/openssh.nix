{ config, lib, pkgs, modulesPath, ... }:
{
  enable = true;
  ports = [ 22 2222];
  settings = {
    PasswordAuthentication = true;
    AllowUsers = "miika";
    UseDns = true;
    X11Forwarding = false;
    PermitRootLogin = "prohibit-password"; # "yes", "without-password", "prohibit-password", "forced-commands-only", "no"
  };
}