{ config, lib, pkgs, modulesPath, ... }:
{
  # Define a user account. Don't forget to set a password with ‘passwd’
  users.users.miika = {
    isNormalUser = true;
    description = "miika";
    shell = pkgs.zsh;
    extraGroups = [ "networkmanager" "wheel" "audio" "docker"];
    packages = with pkgs; [];
  };
}