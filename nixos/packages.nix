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
		#rustdesk-flutter
		waylyrics
		localsend
		telegram-desktop
		clash-nyanpasu
		libreoffice
		jiten
		signal-desktop
		
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

		# GTK Stuff
		sassc
		gtk-engine-murrine
		gnome-themes-extra
		
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
	];
}
