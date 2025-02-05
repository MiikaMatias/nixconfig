{
  description = "Flake for my worshop";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
  };

  outputs = { self, nixpkgs }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    nixosConfigurations.schworshp = nixpkgs.lib.nixosSystem {
      inherit system;
      modules = [
        ./configuration.nix
        (import /etc/nixos/hardware-configuration.nix) # don't lock hardware 
      ];
    };
  };
}
