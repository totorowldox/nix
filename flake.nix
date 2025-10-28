{

  description = "Remo's NixOS System Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";

    nix-gaming.url = "github:fufexan/nix-gaming";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:nix-community/stylix/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    niri-caelestia-shell = {
      url = "github:jutraim/niri-caelestia-shell";
      #inputs.nixpkgs.follows = "nixpkgs"; # Remove when upgrading to 25.11
    };

    caelestia-cli = {
      url = "github:caelestia-dots/cli";
      #inputs.nixpkgs.follows = "nixpkgs"; # ...
    };

    minegrub-theme.url = "github:Lxtharia/minegrub-theme";
  };

  outputs = { nixpkgs, stylix, nix-gaming, home-manager, nur
    , niri-caelestia-shell, ... }@inputs:
    let
      system = "x86_64-linux";
      flakePath = "~/nix";
      pkgs = nixpkgs.legacyPackages.${system};
      colorScheme = rec {
        useImage = false;
        image = ./assets/nixos-kukuru-wallpaper.png;

        name = "gruvbox-dark";
        # tomorrow-night-eighties
        # catppuccin-macchiato
        #
        # gruvbox-dark


        path = "${pkgs.base16-schemes}/share/themes/${name}.yaml";
        polarity = "dark";
        terminal-opacity = 1;
      };
      fontConfig = { monospace = { name = "Maple Mono NF CN"; }; };
    in {

      nixosConfigurations.remoaku = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs; };
        modules = [
          { nixpkgs.overlays = [ nur.overlays.default ]; }
          stylix.nixosModules.stylix
          {
            stylix = {
              enable = true;
              image = if colorScheme.useImage then colorScheme.image else null;
              polarity = colorScheme.polarity;
              fonts = fontConfig;
              opacity.terminal = colorScheme.terminal-opacity;
            } // nixpkgs.lib.optionalAttrs (!colorScheme.useImage) {
              base16Scheme = colorScheme.path;
            };
            disabledModules = [
              "${stylix}/modules/gnome/nixos.nix"
            ]; # Manually disable GNOME shell
          }
          inputs.minegrub-theme.nixosModules.default
          ./nixos/configuration.nix
        ];
      };

      homeConfigurations.remo = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = { inherit inputs flakePath; };
        modules = [
          { nixpkgs.overlays = [ nur.overlays.default ]; }
          stylix.homeModules.stylix
          niri-caelestia-shell.homeManagerModules.default
          {
            stylix = {
              enable = true;
              image = if colorScheme.useImage then colorScheme.image else null;
              polarity = colorScheme.polarity;
              fonts = fontConfig;
            } // nixpkgs.lib.optionalAttrs (!colorScheme.useImage) {
              base16Scheme = colorScheme.path;
            };
          }
          ./home-manager/remo.nix
        ];
      };
    };

}
