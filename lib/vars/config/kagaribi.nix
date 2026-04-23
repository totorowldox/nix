let defaultProtonVersion = "dwproton-10.0-24";
in {
  displays = {
    "eDP-1" = {
      width = 2560;
      height = 1600;
      refresh = 180.0;
      position = {
        x = 2560;
        y = 720;
      };
    };
    "HDMI-A-1" = {
      width = 2560;
      height = 1440;
      refresh = 143.981;
      position = {
        x = 0;
        y = 0;
      };
      default = true;
    };
  };

  shellAliases = {
    wuwa = ''
      GAMEID=umu-3513350 \
      PROTONPATH="$HOME/.var/app/com.valvesoftware.Steam/data/Steam/compatibilitytools.d/${defaultProtonVersion}" \
      umu-run "/media/windows/d/Wuthering Waves/Wuthering Waves Game/Client/Binaries/Win64/Client-Win64-Shipping.exe"
    '';

    nte = ''
      GAMEID=umu-3513350 \
      PROTONPATH="$HOME/.var/app/com.valvesoftware.Steam/data/Steam/compatibilitytools.d/${defaultProtonVersion}" \
      umu-run "/media/windows/d/Neverness To Everness/NTELauncher.exe"
    '';
  };

  shellInitContent = ''
    function umu() {
      if [[ -z "$1" ]]; then
        echo "Usage: umu <path/to/exe> [args]"
        return 1
      fi

      PROTONPATH="$HOME/.var/app/com.valvesoftware.Steam/data/Steam/compatibilitytools.d/${defaultProtonVersion}" \
      umu-run "$@"
    }
  '';
}
