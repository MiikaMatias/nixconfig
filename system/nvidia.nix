{ config, lib, pkgs, modulesPath, ... }:
{
  # NVIDIA drivers
  hardware = {
    opengl.enable=true;
    nvidia = {
      open=true;
      modesetting.enable=true;
      powerManagement.enable=true;
    };
  };
}