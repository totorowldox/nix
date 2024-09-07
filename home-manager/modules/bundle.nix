{
	imports = [
		./catppuccin.nix
		./kitty.nix
		./fastfetch.nix
		./git.nix
		./mako.nix
		./wofi.nix
		./ssh.nix
		./wlogout.nix
		#./waylyrics.nix #waylyrics doesn't start for Read-only file system
		# MAKE MANUAL CHANGE TO ~/.config/waylyrics/config.toml
		# --------------------------------
		# Result:
		#     NOT DECLARATIVE CONFIGURATION
		#     DERIVATIONS -999,999,999
		
		./wms/hyprland.nix
		./wms/waybar.nix
		./wms/hyprlock.nix
		./apps/bundle.nix
		./themes/bundle.nix
	];
}
