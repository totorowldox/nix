{lib, ...} : {
	programs.kitty = {
		enable = true;
		
		shellIntegration.enableZshIntegration = true;
		settings = {
			scrollback_lines = 10000;
			enable_audio_bell = false;
			update_check_interval = 0;
			
			scrollback_indicator_opacity = "0.5";
			detect_url = true;
			
			background_opacity = lib.mkForce "0.9";
			background_blur = 30;
			
		};
	};
}
