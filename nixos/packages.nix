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
		clash-nyanpasu
		
		# Windows program runner
		wine
		winetricks
		protonup-qt
		
		# Coding
		vscode
		cpeditor
		gcc
		gdb
		clang-tools
		just
		
		# CLI stuffs
		thefuck
		fastfetch
		tree
		go-musicfox
		z-lua
		cmd-wrapped
		fzf
		
		# Terminal
		# alacritty
		kitty # For image support
		
		# Utils
		pavucontrol
		
		# WMs and stuff
		waybar
		(waybar.overrideAttrs (oldAttrs: {
			mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
			})
		)
		
		# Wallpaper
		swww
		mpvpaper
		
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
