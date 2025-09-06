{
	imports = [
		./apps
		./themes
		./wms

		./fastfetch.nix
		./git.nix
		./kitty.nix
		./ssh.nix
		./wlogout.nix
		#./waylyrics.nix #waylyrics doesn't start for Read-only file system
		# MAKE MANUAL CHANGE TO ~/.config/waylyrics/config.toml
		# --------------------------------
		# Result:
		#     NOT DECLARATIVE CONFIGURATION
		#     DERIVATIONS -999,999,999
	];
}
