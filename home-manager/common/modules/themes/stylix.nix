{ theme, lib, ... }: {
  stylix = {
    enable = true;
    image =
      if theme.colorScheme.useImage then theme.colorScheme.image else null;
    base16Scheme =
      lib.mkIf (!theme.colorScheme.useImage) theme.colorScheme.path;
    polarity = theme.colorScheme.polarity;
    fonts = theme.fonts;
    targets = {
      hyprlock.enable = false;
      hyprland.enable = true;
      yazi.enable = true;
      kde.enable = true;
      btop.enable = true;
      cava.enable = true;
      tmux.enable = true;
      kitty.enable = true;
      fcitx5.enable = true;
      firefox = {
        enable = true;
        colorTheme.enable = true;
        profileNames = [ "remo" ];
      };
      gedit.enable = true;
      gtk = {
        enable = true;
        flatpakSupport.enable = false; # Fix for flatpak packages (steam etc.)
      };
      gtksourceview.enable = true;
      qt.enable = true;
      lazygit.enable = true;
      wofi.enable = true;
      waybar.enable = false;
      vscode.enable = true;
      vicinae.enable = true;
    };
  };
}
