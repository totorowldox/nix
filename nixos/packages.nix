{ pkgs, ...} : {

	nixpkgs.config.allowUnfree = true;
	
	environment.systemPackages =
	let x11Args = ["--ozone-platform=x11" "--enable-features=UseOzonePlatform"]; in 
	with pkgs; [
		# Desktop Apps
		firefox
		(microsoft-edge.override {
			commandLineArgs = x11Args;
		})
		wofi
		qq
		mpv
		celluloid
		gparted
		rustdesk-flutter
		waylyrics
		localsend
		telegram-desktop
		
		# Windows program runner
		wine
		winetricks
		protonup-qt
		
		# Logout etc
		swaylock-effects
		
		# Coding
		vscode
		cpeditor
		gcc
		gdb
		clang-tools
		
		# CLI stuffs
		thefuck
		fastfetch
		tree
		go-musicfox
		
		# Terminal
		# alacritty
		kitty # For image support
		
		# Utils
		v2ray
		fuse
		pavucontrol
		
		# WMs and stuff
		waybar
		(waybar.overrideAttrs (oldAttrs: {
			mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
			})
		)
		xdg-desktop-portal-hyprland
		
		# Wallpaper
		swww
		
		# Notification Controller
		libnotify
		swaynotificationcenter
		
		# Wayland Stuff
		xwayland
		wl-clipboard
		cliphist

		# GTK Stuff
		sassc
		gtk-engine-murrine
		gnome.gnome-themes-extra
		
		# Screenshotting
		grim
		grimblast
		slurp
		flameshot
		swappy
		
		# Others
		home-manager
		
		# Polkit
		polkit_gnome
	];
	
	programs = {
		steam = {
			enable = true;
		};
	};
}
