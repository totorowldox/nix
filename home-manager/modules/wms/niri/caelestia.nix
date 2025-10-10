{ config, inputs, pkgs, ... }: {
  programs.caelestia = {
    enable = true;
    #systemd.enable = true;
    cli = {
      enable = true;
      settings.theme = {
        enableTerm = false;
        enableDiscord = false;
        enableSpicetify = false;
        enableBtop = false;
        enableCava = false;
        enableGtk = false;
        enableQt = false;
      };
    };
    settings = {
      appearance.font.family = {
        mono = config.stylix.fonts.monospace.name;
        #sans = ;
      };
      background.enabled = false;
      bar = {
        persistent = true;
        entries = [
          {
            id = "logo";
            enabled = true;
          }
          {
            id = "spacer";
            enabled = true;
          }
          {
            id = "activeWindow";
            enabled = true;
          }
          {
            id = "spacer";
            enabled = true;
          }
          {
            id = "tray";
            enabled = true;
          }
          {
            id = "clock";
            enabled = true;
          }
          {
            id = "statusIcons";
            enabled = true;
          }
          {
            id = "power";
            enabled = true;
          }
        ];
        tray = {
          background = true;
          recolour = true;
        };
      };
      services = {
        weatherLocation = "宁波市, 浙江省";
        useFahrenheit = false;
        smartScheme = false;
        useTwelveHourClock = false;
      };
    };
  };
}
