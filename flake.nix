{

	description = "Remo's NixOS System Configuration";
	
	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
		
		catppuccin.url = "github:catppuccin/nix";
	
		home-manager = {
			url = "github:nix-community/home-manager/release-24.05";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = { nixpkgs, catppuccin, home-manager, ... }@inputs :
		let
			system = "x86_64-linux";
		in {
			
		nixosConfigurations.remoaku = nixpkgs.lib.nixosSystem {
			inherit system;
			modules = [
				catppuccin.nixosModules.catppuccin
				./nixos/configuration.nix
			];
		};

		homeConfigurations.remo = home-manager.lib.homeManagerConfiguration {
			pkgs = nixpkgs.legacyPackages.${system};
			modules = [
				catppuccin.homeManagerModules.catppuccin
				./home-manager/home.nix
			];
		};
	};

}
