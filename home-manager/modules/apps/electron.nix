{
	home.file = let 
		arg = ''--use-wayland-ime --ozone-platform-hint=auto --enable-features=WaylandWindowDecorations'';
	in {
		".config/electron-flags.conf" = {
			text = arg;
		};
		".config/electron12-flags.conf" = {
			text = arg;
		};
		".config/electron13-flags.conf" = {
			text = arg;
		};
		".config/electron14-flags.conf" = {
			text = arg;
		};
		".config/electron15-flags.conf" = {
			text = arg;
		};
		".config/electron16-flags.conf" = {
			text = arg;
		};
		".config/electron17-flags.conf" = {
			text = arg;
		};
		".config/electron18-flags.conf" = {
			text = arg;
		};
		".config/electron19-flags.conf" = {
			text = arg;
		};
	};
	
}
