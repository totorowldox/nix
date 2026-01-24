{
  displays = {
    "eDP-1" = {
      width = 2560;
      height = 1600;
      refresh = 180.0;
    };
    "HDMI-A-1" = {
      width = 2560;
      height = 1440;
      refresh = 143.981;
    };
  };

  shellAliases = let defaultProtonVersion = "dwproton-10.0-14-x86_64";
  in {
    wuwa = ''
      GAMEID=umu-3513350 \
      PROTONPATH="$HOME/.var/app/com.valvesoftware.Steam/data/Steam/compatibilitytools.d/${defaultProtonVersion}" \
      umu-run "/media/windows/d/Wuthering Waves/Wuthering Waves Game/Client/Binaries/Win64/Client-Win64-Shipping.exe"
    '';

    Endfield = ''
      PROTONPATH="$HOME/.var/app/com.valvesoftware.Steam/data/Steam/compatibilitytools.d/${defaultProtonVersion}" \
      umu-run "/media/windows/d/Hypergryph Launcher/games/Endfield Game/Endfield.exe"
    '';
  };
}
