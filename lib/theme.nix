{ pkgs }:

rec {
  wallpapers = [
    {
      name = "nixos-kukuru-wallpaper.png";
      colorSchemeName = "kukuru-wallpaper";
      convert = "lutgen";
    }
    {
      name = "2560x1440px_B_katan.png";
      colorSchemeName = "katan-B";
      convert = "lutgen";
    }
  ];

  colorScheme = rec {

    matugenToBase16 = wallpaper:
      let
        inherit polarity;
        scheme = if builtins.hasAttr "matugenScheme" wallpaper then
          wallpaper.matugenScheme
        else
          "scheme-tonal-spot";
      in pkgs.runCommand "${wallpaper.colorSchemeName}.yaml" {
        buildInputs = [ pkgs.matugen ];
      } ''
        echo "Starting matugen conversion..."
        ${pkgs.python3}/bin/python ${./scripts/matu2base16.py} ${
          ../assets
        }/${wallpaper.name} \
        --name ${wallpaper.colorSchemeName} --polarity ${polarity} --type ${scheme} --output $out
        if [ ! -f "$out" ]; then
          echo "ERROR: Output file $out was not created!"
          exit 1
        fi
      '';

    useImage = false;
    wallpaper = builtins.elemAt wallpapers 0;

    name = if useImage then wallpaper.name else "gruvbox-dark";
    # tomorrow-night-eighties
    # catppuccin-macchiato
    #
    # gruvbox-dark

    path = if useImage then
      "${matugenToBase16 wallpaper}"
    else
      "${pkgs.base16-schemes}/share/themes/${name}.yaml";
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
