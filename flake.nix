{

	description = "Remo's NixOS System Configuration";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
		
		catppuccin.url = "github:catppuccin/nix";

		anyrun = {
     		url = "github:anyrun-org/anyrun";
      		inputs.nixpkgs.follows = "nixpkgs";
    	};

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
	};

	outputs = { nixpkgs, catppuccin, stylix, anyrun, nix-gaming, home-manager, ... }@inputs :
		let
			system = "x86_64-linux";
			flakePath = "~/nix";
			pkgs = nixpkgs.legacyPackages.${system};
			colorScheme = rec {
				name = "catppuccin-macchiato";
				path = "${pkgs.base16-schemes}/share/themes/${name}.yaml";
				polarity = "dark";
				terminal-opacity = 0.8;
			};
			fontConfig = {
				monospace = {
					name = "Maple Mono NF CN";
				};
			};
		in {
			
		nixosConfigurations.remoaku = nixpkgs.lib.nixosSystem {
			inherit system;
			specialArgs = {
				inherit inputs;
			};
			modules = [
				#inputs.nur-xddxdd.nixosModules.setupOverlay
				#inputs.nur-xddxdd.nixosModules.nix-cache-garnix
				#catppuccin.nixosModules.catppuccin
				stylix.nixosModules.stylix
				{
					stylix = {
						enable = true;
						polarity = colorScheme.polarity;
						base16Scheme = colorScheme.path;
						fonts = fontConfig;
						opacity.terminal = colorScheme.terminal-opacity;
					};
					disabledModules = [ "${stylix}/modules/gnome/nixos.nix" ]; # Manually disable GNOME shell
				}
				./nixos/configuration.nix
			];
		};

		homeConfigurations.remo = home-manager.lib.homeManagerConfiguration {
			inherit pkgs;
			extraSpecialArgs = {
				inherit inputs;
				inherit flakePath;
			};
			modules = [
				catppuccin.homeModules.catppuccin
				stylix.homeModules.stylix
				{
					stylix = {
						enable = true;
						polarity = colorScheme.polarity;
						base16Scheme = colorScheme.path;
						fonts = fontConfig;
					};
				}
				./home-manager/home.nix
			];
		};
	};

}
