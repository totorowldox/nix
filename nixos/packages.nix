{pkgs, ...} : {
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
		
		# Windows program runner
		wine
		winetricks
		steam
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
	
	#fonts.enableDefaultPackages = true;
	
	fonts.packages = with pkgs; [
		inter
		noto-fonts
		noto-fonts-cjk-sans
		noto-fonts-cjk-serif
		noto-fonts-color-emoji #noto-fonts-emoji

		#source-han-mono
		#source-han-sans
		#source-han-serif

		jetbrains-mono
		cascadia-code
		powerline-fonts
		powerline-symbols
	];
	
	#fonts.enableDefaultPackages = true;

	fonts.fontconfig = {
		defaultFonts = {
			serif = [
				"Inter"
				"Noto Serif"
				"Noto Serif CJK SC"
				"Noto Serif CJK JP"
			];
			sansSerif = [
				"Inter"
				"Noto Sans"
				"Noto Sans CJK SC"
				"Noto Sans CJK JP"
			];
			monospace = [
				"JetBrains Mono"
				"Noto Sans Mono CJK SC"
				"Noto Sans Mono CJK JP"
			];
			emoji = [ "Noto Color Emoji" ];
		};

		# Fixes pixelation
		antialias = true;

		# Fixes antialiasing blur
		#hinting = {
		#	enable = true;
		#	style = "full";
		#	autohint = true;
		#};

		subpixel = {
			# Makes it bolder
			rgba = "rgb";
			lcdfilter = "default";
		};
	};
}
