{
  description = "Modular NixOS and Home Manager configuration";

  inputs = {

    # Core
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    # Desktop
    caelestia-shell = {
      url = "github:caelestia-dots/shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    silentSDDM = {
      url = "github:uiriansan/SilentSDDM";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Applications
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
  };

  outputs = inputs@{ self, nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";

      overlays = [
        (final: prev: {
          caelestia-shell =
            inputs.caelestia-shell.packages.${system}.default;
        })
      ];
    in
    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        inherit system;
      
        specialArgs = { 
          inherit inputs; 
        };

        modules = [
          {
            nixpkgs.overlays = overlays;
          }

          # System
          ./hosts/suraj/hardware.nix
          ./hosts/suraj/system.nix

          # Home Manager
          home-manager.nixosModules.home-manager    
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.extraSpecialArgs = {
              inherit inputs;
            };

            home-manager.users.suraj = import ./home/suraj;
          }
        ];
      };
    };
}
