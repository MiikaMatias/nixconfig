{
  description = "Flake for my workshop";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs}: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    nixosConfigurations.schworshp = nixpkgs.lib.nixosSystem {
      inherit system;
      modules = [
        ./configuration.nix
        (import /etc/nixos/hardware-configuration.nix)
      ];
    };
  };
}
