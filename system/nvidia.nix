{ config, lib, pkgs, modulesPath, ... }:
{
  # NVIDIA drivers
  hardware = {
    opengl.enable=true;
    nvidia = {
      modesetting.enable=true;
      powerManagement.enable=true;
    };
  };
}