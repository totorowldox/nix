{ pkgs, inputs, ... }: {

  #config.common = {
  #	default = [ "gnome" "gtk" ];
  #};
  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.desktopManager.wallpaper.mode = "fill";

  # Enable the GDM
  services.displayManager.gdm.enable = true;
  services.displayManager.gdm.wayland = true;
  services.desktopManager.gnome.enable = false;

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
  xdg.portal.config = {
    common.default = "*";
    niri = {
      default = [ "gnome" ];
      # ScreenCast is specifically required for niri to work with GNOME's portal
      "org.freedesktop.impl.portal.ScreenCast" = [ "gnome" ];
      "org.freedesktop.impl.portal.Screenshot" = [ "gnome" ];
    };
  };
  xdg.portal.xdgOpenUsePortal = true;
  programs.dconf.enable = true;
  xdg.portal.extraPortals = with pkgs; [ xdg-desktop-portal-gnome ];
}
