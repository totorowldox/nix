{ inputs, pkgs, ... }: {
  imports = [ inputs.vicinae.homeManagerModules.default ];
  services.vicinae = {
    enable = true; # default: false
    systemd = {
      enable = true; # default: false
      autoStart = true; # default: false
      environment = { USE_LAYER_SHELL = 1; };
    };
    settings = {
      close_on_focus_loss = true;
      consider_preedit = true;
      pop_to_root_on_close = true;
      favicon_service = "twenty";
      #search_files_in_root = true;
      font = {
        normal = {
          size = 12;
          normal = "Maple Mono NF CN";
        };
      };
      theme = {
        light = {
          name = "stylix";
          icon_theme = "default";
        };
        dark = {
          name = "stylix";
          icon_theme = "default";
        };
      };
      launcher_window = { opacity = 0.98; };
    };
    extensions =
      with inputs.vicinae-extensions.packages.${pkgs.stdenv.hostPlatform.system}; [
        nix
        power-profile
        # Extension names can be found in the link below, it's just the folder names
      ];
  };
}
