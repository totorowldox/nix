{ pkgs, inputs, ...} : {

	nixpkgs.config.allowUnfree = true;

	services.flatpak.enable = true;
	
	environment.systemPackages = with pkgs; [
		# Desktop Apps
		firefox
		wofi
		mpv
		celluloid # GUI-fied mpv
		gparted # Disk manager
		#rustdesk-flutter
		waylyrics # Lyrics displayer
		localsend # LAN file sharing tool
		clash-nyanpasu
		libreoffice
		jiten # CLI Japanese dictionary
		nautilus # File manager
		gedit # Text editor
		smile # Emoji picker
		musescore # Music score engraving app
		mission-center # Resource management

		# SMS
		qq
		signal-desktop
		telegram-desktop
		
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
		devenv
		direnv
		
		# CLI stuffs
		thefuck
		fastfetch
		tree
		go-musicfox
		cmd-wrapped
		fzf
		tmux
		at
		zoxide # better cd
		eza # better ls
		nh # better nix cli
		
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

		# Theming Stuff
		sassc
		#gtk-engine-murrine
		#gnome-themes-extra
		
		# Screenshotting
		grim
		grimblast
		slurp
		flameshot
		swappy
		
		# Others
		home-manager
		
		# Security
		polkit_gnome
		libsForQt5.kleopatra
		gnupg
		pinentry
		pinentry-gnome3

		# XDG portal
		xdg-desktop-portal-hyprland
	];
}
