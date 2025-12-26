{ pkgs }:

rec {
  colorScheme = rec {
    useImage = false;
    image = ../assets/nixos-kukuru-wallpaper.png;

    name = "gruvbox-dark";
    path = "${pkgs.base16-schemes}/share/themes/${name}.yaml";
    polarity = "dark";
    terminalOpacity = 0.9;
  };

  fonts = { monospace = { name = "Maple Mono NF CN"; }; };
}
