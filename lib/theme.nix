{ pkgs }:

rec {
  colorScheme = rec {
    useImage = false;
    image = ../assets/nixos-kukuru-wallpaper.png;

    name = "gruvbox-dark";
    # tomorrow-night-eighties
    # catppuccin-macchiato
    #
    # gruvbox-dark
    path = "${pkgs.base16-schemes}/share/themes/${name}.yaml";
    polarity = "dark";
    terminalOpacity = 0.9;
  };

  fonts = {
    monospace = { name = "Maple Mono NF CN"; };
    emoji = { name = "Noto Color Emoji"; };
    serif = { name = "Noto Serif CJK JP"; };
    sansSerif = { name = "Noto Sans CJK JP"; };
  };

  cursor = {
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 32;
  };
}
