{ pkgs, config, inputs, flakePath, ... }: {
  imports = [ inputs.niri.homeModules.niri ./waybar.nix ];
  home.packages = with pkgs;
    [
      (xwayland-satellite.override {
        withSystemd = false;
      }) # Niri automatically runs this when xwayland support is required
    ];
  programs.niri = {
    enable = true;
    settings = {

      hotkey-overlay.skip-at-startup = true;

      environment = {
        # Session vars
        XDG_CURRENT_DESKTOP = "niri";
        XDG_SESSION_TYPE = "wayland";
        XDG_SESSION_DESKTOP = "niri";
        MOZ_ENABLE_WAYLAND = "1";

        # QT
        QT_QPA_PLATFORM = "wayland";
        QT_AUTO_SCREEN_SCALE_FACTOR = "1";

        # GTK
        GDK_BACKEND = "wayland";

        # Cursors
        XCURSOR_SIZE = "36";

        XDG_SCREENSHOTS_DIR = "~/screens";
        SDL_VIDEODRIVER = "wayland";
      };

      input = {
        keyboard.xkb.layout = "us";
        focus-follows-mouse = { max-scroll-amount = "10%"; };
        touchpad.natural-scroll = false;
        # sensitivity maps to accel-speed, 0 means no modification
        mouse.accel-speed = 0.0;
      };

      outputs = {
        "DP-1" = {
          mode.width = 2560;
          mode.height = 1440;
          mode.refresh = 180.0;
        };
      };

      workspaces = {
        "dev" = { };
        "browser" = { };
        "chat" = { };
        "gaming" = { };
      };

      layout = {
        gaps = 5; # Inner gaps
        struts = {
          left = 20;
          right = 20;
          top = 20;
          bottom = 20;
        }; # Outer gaps emulation
        center-focused-column = "never"; # Adjust as needed
        always-center-single-column = false;
        border = {
          enable = true;
          width = 4;
          active.gradient = {
            from = config.lib.stylix.colors.withHashtag.base0D; # "#FF66B3";
            to = config.lib.stylix.colors.withHashtag.base0E; # "#FFCCFF";
            angle = 45;
            in' = "oklab";
          };
          inactive.color =
            config.lib.stylix.colors.withHashtag.base03; # "#595959";
        };
        focus-ring.enable = false;
        preset-column-widths = [
          { proportion = 0.3333; }
          { proportion = 0.5; }
          { proportion = 0.6667; }
        ];
      };

      animations = {
        window-open = {
          kind.easing = {
            duration-ms = 200;
            curve = "cubic-bezier";
            curve-args = [ 0.2 1.2 0.3 1.1 ]; # Pronounced bounce
          };
          custom-shader = builtins.readFile ./shader/open.glsl;
        };
        window-close = {
          kind.easing = {
            duration-ms = 200;
            curve = "cubic-bezier";
            curve-args = [ 0.2 1.2 0.3 1.1 ]; # Matching bounce
          };
          custom-shader = builtins.readFile ./shader/close.glsl;
        };
        window-movement.kind = {
          spring = {
            damping-ratio = 0.85; # Slightly underdamped for a subtle bounce
            stiffness = 1200; # Higher stiffness for quicker response
            epsilon = 1.0e-4;
          };
        };
        window-resize.kind = {
          spring = {
            damping-ratio = 0.9; # Near-critical damping for smooth resizing
            stiffness = 1000; # Balanced stiffness for fluid resizing
            epsilon = 1.0e-4;
          };
        };
        workspace-switch.kind = {
          spring = {
            damping-ratio = 0.8; # More bounce for a dynamic workspace switch
            stiffness = 1500; # Higher stiffness for a faster snap
            epsilon = 1.0e-4;
          };
        };
      };

      prefer-no-csd = true;

      window-rules = [
        {
          geometry-corner-radius = {
            bottom-left = 10.0;
            bottom-right = 10.0;
            top-left = 10.0;
            top-right = 10.0;
          };
          clip-to-geometry = true;
          draw-border-with-background = false;
        }
        {
          matches = [{ app-id = "^(imv)$"; }];
          tiled-state = false;
        }
        {
          matches = [{ app-id = "^(mpv)$"; }];
          tiled-state = false;
        }
        {
          matches = [{ app-id = "^(celluloid)$"; }];
          tiled-state = false;
        }
        {
          matches = [{ app-id = "^(QQ)$"; }];
          tiled-state = false;
          default-floating-position = {
            x = 5.0e-2;
            y = 0.1;
            relative-to = "top-left";
          };
        }
        {
          matches = [{ app-id = "^(zenity)$"; }];
          tiled-state = false;
        }
        {
          matches = [{ app-id = "^(org.gnome.TextEditor)$"; }];
          tiled-state = false;
        }
        {
          matches = [{ app-id = "^(org.gnome.Nautilus)$"; }];
          tiled-state = false;
        }
        {
          matches = [{ app-id = "^(io.github.celluloid_player.Celluloid)$"; }];
          tiled-state = false;
        }
        {
          matches = [{ app-id = "^(it.mijorus.smile)$"; }];
          tiled-state = false;
        }
        {
          matches = [{ title = "pavucontrol"; }];
          tiled-state = false;
        }
        {
          matches = [{ title = "Waylyrics"; }];
          tiled-state = false;
          draw-border-with-background = false; # Approximate noborder/noshadow
          default-floating-position = {
            x = 0.2;
            y = 0.8;
            relative-to = "bottom-left";
          };
        }
        # Note: Niri uses app-id instead of class; adjust if needed. No noblur, noshadow directly.
      ];

      spawn-at-startup = [
        { argv = [ "swww" "init" ]; }
        {
          argv =
            [ "swww" "img" "${flakePath}/assets/nixos-anime-wallpaper.png" ];
        }
        { argv = [ "swaync" ]; }
        { argv = [ "waybar" ]; }
        { argv = [ "wl-paste" "--type" "text" "--watch" "cliphist" "store" ]; }
        { argv = [ "wl-paste" "--type" "image" "--watch" "cliphist" "store" ]; }
        { argv = [ "fcitx5" "-d" "-r" ]; }
        { argv = [ "blueman-applet" ]; }
        { sh = "${flakePath}/scripts/startup-apps.sh"; }
      ];

      binds = {
        "Mod+V".action.spawn-sh =
          "cliphist list | wofi --dmenu | cliphist decode | wl-copy";

        "Mod+Return".action.spawn = "kitty";
        "Mod+Q".action.close-window = { };
        "Mod+Shift+M".action.fullscreen-window = { };
        "Mod+E".action.spawn-sh = "nautilus --new-window";
        "Mod+F".action.toggle-window-floating = { };
        "Mod+M".action.maximize-column = { };
        "Mod+S".action.spawn = "anyrun";
        "Mod+Tab".action.spawn-sh = "swaync-client -t";
        "Mod+L".action.spawn = "wlogout";
        "Mod+R".action.switch-preset-column-width = { };

        # Focus
        "Mod+Left".action.focus-column-left = { };
        "Mod+Right".action.focus-column-right = { };
        "Mod+Up".action.focus-window-up = { };
        "Mod+Down".action.focus-window-down = { };
        "Mod+Home".action.focus-column-first = { };
        "Mod+End".action.focus-column-last = { };
        "Mod+Page_Down".action.focus-workspace-down = { };
        "Mod+Page_Up".action.focus-workspace-up = { };
        "Mod+O".action.toggle-overview = { };

        # Move/Swap
        "Mod+Shift+Left".action.move-column-left = { };
        "Mod+Shift+Right".action.move-column-right = { };
        "Mod+Shift+Up".action.move-window-up = { };
        "Mod+Shift+Down".action.move-window-down = { };
        "Mod+Shift+Home".action.move-column-to-first = { };
        "Mod+Shift+End".action.move-column-to-last = { };
        "Mod+Shift+Page_Down".action.move-column-to-workspace-down = { };
        "Mod+Shift+Page_Up".action.move-column-to-workspace-up = { };
        "Mod+Ctrl+Page_Down".action.move-workspace-down = { };
        "Mod+Ctrl+Page_Up".action.move-workspace-up = { };

        # Resize (proportions in Niri)
        "Mod+Ctrl+Left".action.set-column-width =
          "-5%"; # Approximate -60 pixels
        "Mod+Ctrl+Right".action.set-column-width = "+5%";
        "Mod+Ctrl+Up".action.set-window-height = "-5%";
        "Mod+Ctrl+Down".action.set-window-height = "+5%";
        "Mod+Comma".action.consume-or-expel-window-left = { };
        "Mod+Period".action.consume-or-expel-window-right = { };

        # Workspaces (Niri uses relative/indexed; approximating 1-10)
        "Mod+1".action.focus-workspace = 1;
        "Mod+2".action.focus-workspace = 2;
        "Mod+3".action.focus-workspace = 3;
        "Mod+4".action.focus-workspace = 4;
        "Mod+5".action.focus-workspace = 5;
        "Mod+6".action.focus-workspace = 6;
        "Mod+7".action.focus-workspace = 7;
        "Mod+8".action.focus-workspace = 8;
        "Mod+9".action.focus-workspace = 9;
        "Mod+0".action.focus-workspace = 10;

        # Move to workspace
        "Mod+Shift+1".action.move-column-to-workspace = 1;
        "Mod+Shift+2".action.move-column-to-workspace = 2;
        "Mod+Shift+3".action.move-column-to-workspace = 3;
        "Mod+Shift+4".action.move-column-to-workspace = 4;
        "Mod+Shift+5".action.move-column-to-workspace = 5;
        "Mod+Shift+6".action.move-column-to-workspace = 6;
        "Mod+Shift+7".action.move-column-to-workspace = 7;
        "Mod+Shift+8".action.move-column-to-workspace = 8;
        "Mod+Shift+9".action.move-column-to-workspace = 9;
        "Mod+Shift+0".action.move-column-to-workspace = 10;

        # Workspace scroll with mouse
        "Mod+WheelScrollDown".action.focus-workspace-down = { };
        "Mod+WheelScrollUp".action.focus-workspace-up = { };

        # Screenshots
        "Print".action.spawn-sh = "grim - | swappy -f -";
        "Mod+Print".action.spawn-sh = "grim - | wl-copy";
        "Ctrl+Alt+A".action.spawn-sh = ''grim -g "$(slurp)" - | swappy -f -'';
        "Mod+A".action.spawn-sh = ''grim -g "$(slurp)" - | wl-copy'';

        # Waybar signals
        "Mod+B".action.spawn = [ "pkill" "-SIGUSR1" "waybar" ];
        "Mod+W".action.spawn = [ "pkill" "-SIGUSR2" "waybar" ];

        # Cycle next
        # "Alt+Tab".action.focus-column-right = {};
        # "Alt+Shift+Tab".action.focus-column-left = {};

        # App shortcuts
        "Mod+Semicolon".action.spawn = "smile";
      };
    };
  };
}
# Notes on translation:
# - Niri is a scrollable-tiling compositor, differing from Hyprland's dwindle layout. Workspaces are dynamic and scrollable, so numbered workspace binds are approximated using focus/move to index.
# - No support for blur, rounding, shadows, dim_inactive, or some misc options; these were omitted.
# - Window rules use app-id (Wayland equivalent to class); adjust if needed. No noblur, noshadow directly.
# - Animations approximated with similar curves and springs.
# - Monitor config: Niri auto-selects modes; add output blocks like output "eDP-1" { mode "auto"; prefer-highest-refresh true; } for specific monitors if needed.
# - XWayland is enabled by default in Niri.
# - For xdg-desktop-portal, configure separately, e.g., xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-gtk]; as Niri doesn't have a specific portal package like Hyprland.
# - Research sources: Niri wiki pages on configuration, NixOS/Home-Manager modules for Niri.
# - Environment variables removed as they are not directly supported in the module; consider setting them via home.sessionVariables or raw config if necessary.
# - Unsupported window-rule fields like default-window-height, default-column-width, and accept-focus removed.
# - Assumed relative-to for default-floating-position based on common placements; adjust as needed.
