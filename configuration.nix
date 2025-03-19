{ config, pkgs, ... }:
{
  nix.settings.experimental-features = [ "nix-command" "flakes"];
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.a
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05";
  nixpkgs.config.allowUnfree = true;
  imports =
  [
    ./development/k8s.nix
    ./development/languages.nix
    ./development/llvm.nix
    ./development/models.nix
    ./development/rpi.nix
    ./development/terraform.nix
    ./development/utilities.nix
    ./development/virtualbox.nix

    ./gaming/general.nix
    ./gaming/steam.nix

    ./hardware-configuration.nix

    ./software/browser.nix
    ./software/general.nix
    ./software/terminal.nix

    ./system/audio.nix
    ./system/bootloader.nix
    ./system/displayserver.nix
    ./system/lid.nix
    ./system/localization.nix
    ./system/networking.nix
    ./system/nvidia.nix
    ./system/redshift.nix
    ./system/systemd-timers.nix
    ./system/users.nix
    ./system/windowmanager.nix
  ];


}

