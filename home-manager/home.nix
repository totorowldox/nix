{ config, pkgs, ... }: {

	# WHY!!!
	nixpkgs.config.allowUnfree = true;

	home = {
		username = "remo";
		homeDirectory = "/home/remo";
		stateVersion = "24.05";
		sessionVariables = {
			NIXOS_OZONE_WL = "1";
		};
	};
	
	imports = [
		./modules

		./packages.nix
		./zsh.nix
		# ./nushell.nix
		./vars.nix
	];
}
