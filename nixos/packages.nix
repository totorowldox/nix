{ pkgs, inputs, ...} : {

	nixpkgs.config.allowUnfree = true;

	services.flatpak.enable = true;
	
	environment.systemPackages = with pkgs; [
		# Desktop Apps
		firefox
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
		libreoffice
		jiten
		
		# Windows program runner
		wine
		wine64
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
		cmd-wrapped
		fzf
		zoxide
		tmux
		
		# Terminal
		# alacritty
		kitty # For image support
		
		# Utils
		pavucontrol
		waydroid
		zip
		unzip
		
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
}
