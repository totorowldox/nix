{

  description = "Remo's NixOS System Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";

    nix-gaming.url = "github:fufexan/nix-gaming";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:nix-community/stylix/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    niri-caelestia-shell = {
      url = "github:jutraim/niri-caelestia-shell";
    };

    caelestia-cli = {
      url = "github:caelestia-dots/cli";
    };

    minegrub-theme.url = "github:Lxtharia/minegrub-theme";
  };

  outputs = { nixpkgs, stylix, nix-gaming, home-manager, nur
    , niri-caelestia-shell, ... }@inputs:
    let
      mkHost = { hostname, system ? "x86_64-linux" }:
        let
          pkgs = nixpkgs.legacyPackages.${system};
          theme = import ./lib/theme.nix { inherit pkgs; };
          vars = import ./lib/vars { inherit hostname; };
        in nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs hostname theme; };
          modules = [
            { nixpkgs.overlays = [ nur.overlays.default ]; }

            stylix.nixosModules.stylix
            inputs.minegrub-theme.nixosModules.default

            ./hosts/${hostname}
            ./modules/common
            ./modules/${hostname}

            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = {
                inherit inputs vars theme hostname;
              };
              home-manager.users.remo = {
                imports = [
                  niri-caelestia-shell.homeManagerModules.default
                  ./home-manager/common
                  ./home-manager/${hostname}
                ];
              };
            }
          ];
        };
    in {
      nixosConfigurations = {
        remoaku = mkHost { hostname = "remoaku"; };
        kagaribi = mkHost { hostname = "kagaribi"; };
      };
    };
}
