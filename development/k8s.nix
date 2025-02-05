{ config, lib, pkgs, modulesPath, ... }:
{
    services.k3s.enable = true;

    environment.systemPackages = with pkgs; [
      k3d
      kubectl
      (wrapHelm kubernetes-helm {
        plugins = with pkgs.kubernetes-helmPlugins; [
          helm-secrets
          helm-diff
          helm-s3
          helm-git
        ];
      }) 
    ];
}