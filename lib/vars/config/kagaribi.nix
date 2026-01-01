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

  shellAliases = {
    wuwa = ''
      GAMEID=umu-3513350 \
      PROTONPATH="$HOME/.var/app/com.valvesoftware.Steam/data/Steam/compatibilitytools.d/GE-Proton10-27" \
      umu-run "/media/windows/d/Wuthering Waves/Wuthering Waves Game/Client/Binaries/Win64/Client-Win64-Shipping.exe"
    '';
  };
}
