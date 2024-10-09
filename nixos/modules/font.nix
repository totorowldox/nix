{ pkgs, ... } : {
	
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

		# Fix pixelation
		antialias = true;

		# Fix Steam CJK fonts
		cache32Bit = true;

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