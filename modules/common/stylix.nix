{ theme, lib, ... }:

{
  stylix = {
    enable = true;
    # image =
    #   if theme.colorScheme.useImage then theme.colorScheme.image else null;
    base16Scheme = theme.colorScheme.path;
    polarity = theme.colorScheme.polarity;
    fonts = theme.fonts;
    opacity.terminal = theme.colorScheme.terminalOpacity;
    # disabledModules = [ "gnome" ];

  };
}
