{ config, pkgs, ... }: {

	# WHY!!!
	nixpkgs.config.allowUnfree = true;

	home = {
		username = "remo";
		homeDirectory = "/home/remo";
		stateVersion = "24.05";
	};
	
	imports = [
		./packages.nix
		./modules/bundle.nix
		./zsh.nix
		#./nushell.nix
		./vars.nix
	];
}
