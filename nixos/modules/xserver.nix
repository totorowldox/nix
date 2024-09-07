{pkgs, ...} : {

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.displayManager.gdm.wayland = true;
  services.xserver.desktopManager.wallpaper.mode = "fill";
  services.xserver.desktopManager.gnome.enable = true;
  
  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    #variant = "";
  };

	programs.hyprland = {
		enable = true;
		xwayland.enable = true;	
	};

	# Fuck you nixos manual
	#environment.sessionVariables = {
	#	NIXOS_OZONE_WL = "0"; # set to 1 will crash every electron app
	#};
	
	hardware = {
		opengl.enable = true;
	};
	
	xdg.portal.enable = true;
	xdg.portal.xdgOpenUsePortal = true;
	xdg.portal.extraPortals = with pkgs; [ 
		#xdg-desktop-portal-gtk
		xdg-desktop-portal-hyprland
	];
}
