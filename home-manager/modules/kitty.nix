{
	programs.kitty = {
		enable = true;
		
		#catpuccin.enable = true;
		theme = "Catppuccin-Macchiato";
		
		shellIntegration.enableZshIntegration = true;
		font = {
        		size = 13.0;
        		name = "JetBrains Mono";
		};
		settings = {
			scrollback_lines = 10000;
			enable_audio_bell = false;
			update_check_interval = 0;
			
			scrollback_indicator_opacity = "0.5";
			detect_url = true;
			
			background_opacity = "0.8";
			background_blur = 30;
			
		};
	};
}
