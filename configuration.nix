{ config, pkgs, ... }:
{
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05";
  nixpkgs.config.allowUnfree = true;
  imports =
  [
    ./development/languages.nix
    ./development/models.nix
    ./development/utilities.nix

    ./gaming/steam.nix

    ./hardware-configuration.nix

    ./software/browser.nix
    ./software/general.nix
    ./software/shell.nix

    ./system/audio.nix
    ./system/bootloader.nix
    ./system/displayserver.nix
    ./system/localization.nix
    ./system/networking.nix
    ./system/nvidia.nix
    ./system/users.nix
  ];


}
