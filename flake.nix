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

		nur-xddxdd = {
			url = "github:xddxdd/nur-packages";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = { nixpkgs, catppuccin, anyrun, nix-gaming, nur-xddxdd, home-manager, ... }@inputs :
		let
			system = "x86_64-linux";
			flakePath = "~/nix";
		in {
			
		nixosConfigurations.remoaku = nixpkgs.lib.nixosSystem {
			inherit system;
			specialArgs = {
				inherit inputs;
			};
			modules = [
				nur-xddxdd.nixosModules.setupOverlay
				nur-xddxdd.nixosModules.nix-cache-garnix
				catppuccin.nixosModules.catppuccin
				./nixos/configuration.nix
			];
		};

		homeConfigurations.remo = home-manager.lib.homeManagerConfiguration {
			pkgs = nixpkgs.legacyPackages.${system};
			extraSpecialArgs = {
				inherit inputs;
				inherit flakePath;
			};
			modules = [
				catppuccin.homeModules.catppuccin
				./home-manager/home.nix
			];
		};
	};

}
