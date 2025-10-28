{ pkgs, inputs, ... }: {

  #config.common = {
  #	default = [ "gnome" "gtk" ];
  #};
  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GDM
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.displayManager.gdm.wayland = true;
  services.xserver.desktopManager.wallpaper.mode = "fill";
  services.xserver.desktopManager.gnome.enable = false;

  # Enable COSMIC DE
  #services.desktopManager.cosmic.enable = true;
  #services.displayManager.cosmic-greeter.enable = true;

  # Enable niri
  programs.niri.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    #variant = "";
  };

  # programs.hyprland = {
  # 	enable = true;
  # 	xwayland.enable = true;	
  # };

  environment.sessionVariables = { NIXOS_OZONE_WL = "1"; };

  hardware.graphics.enable = true;

  xdg.portal.enable = true;
  xdg.portal.xdgOpenUsePortal = true;
  programs.dconf.enable = true;
  xdg.portal.extraPortals = with pkgs; [
    xdg-desktop-portal-gtk
    xdg-desktop-portal-gnome
  ];
}
