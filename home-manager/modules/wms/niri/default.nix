{pkgs, inputs, flakePath, ...} : {
    imports = [ inputs.niri.homeModules.niri ];
    home.packages = with pkgs; [
        (xwayland-satellite.override { withSystemd = false; }) # Niri automatically runs this when xwayland support is required
    ];
    programs.niri = {
        enable = true;
        settings = {
            environment = {
                # Session vars
                XDG_CURRENT_DESKTOP="Hyprland";
                XDG_SESSION_TYPE = "wayland";
                XDG_SESSION_DESKTOP = "Hyprland";

                # QT
                QT_QPA_PLATFORM = "wayland;xcb";
                QT_AUTO_SCREEN_SCALE_FACTOR = "1";

                # Cursors
                XCURSOR_SIZE = "36";

                XDG_SCREENSHOTS_DIR = "~/screens";
                SDL_VIDEODRIVER = "wayland";
            };

            input = {
                keyboard.xkb.layout = "us";
                focus-follows-mouse = {
                    max-scroll-amount = "10%";
                };
                touchpad.natural-scroll = false;
                # sensitivity maps to accel-speed, 0 means no modification
                mouse.accel-speed = 0.0;
            };

            outputs = {
                "DP-1" = {
                    mode.width = 2560;
                    mode.height = 1440;
                    mode.refresh = 180.0000;
                };
            };

            layout = {
                gaps = 5;  # Inner gaps
                struts = { left = 20; right = 20; top = 20; bottom = 20; };  # Outer gaps emulation
                center-focused-column = "never";  # Adjust as needed
                always-center-single-column = false;
                border = {
                    enable = true;
                    width = 4;
                    active.gradient = {
                        from = "#FF66B3";
                        to = "#FFCCFF";
                        angle = 45;
                        in' = "oklab";
                    };
                    inactive.color = "#595959";
                };
                focus-ring.enable=false;
                preset-column-widths = [
                { proportion = 0.3333; }
                { proportion = 0.5; }
                { proportion = 0.6667; }
                ];
            };

            animations = {
                # Approximating user's custom animations with Niri's easing/spring options
                window-open.kind.easing = {
                duration-ms = 200;
                curve = "cubic-bezier";
                curve-args = [ 0.05 0.9 0.1 1.05 ];  # myBounce
                };
                window-close.kind.easing = {
                duration-ms = 200;
                curve = "cubic-bezier";
                curve-args = [ 0.05 0.9 0.1 1.05 ];  # myBounce
                };
                window-movement.kind = {
                spring = { damping-ratio = 1.0; stiffness = 800; epsilon = 0.0001; };
                };
                window-resize.kind = {
                spring = { damping-ratio = 1.0; stiffness = 800; epsilon = 0.0001; };
                };
                workspace-switch.kind = {
                spring = { damping-ratio = 1.0; stiffness = 1000; epsilon = 0.0001; };
                };
                # Other animations can be added/adjusted as per Niri docs
            };

            prefer-no-csd = true;  # If needed, but no direct misc like in Hyprland

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
                matches = [ { app-id = "^(imv)$"; } ];
                tiled-state = false;
                }
                {
                matches = [ { app-id = "^(mpv)$"; } ];
                tiled-state = false;
                }
                {
                matches = [ { app-id = "^(celluloid)$"; } ];  # Assuming io.github.celluloid_player.Celluloid
                tiled-state = false;
                }
                {
                matches = [ { app-id = "^(QQ)$"; } ];
                tiled-state = false;
                default-floating-position = { x = 0.05; y = 0.1; relative-to = "top-left"; };  # Approximate %; Niri uses pixels, but % not supported directly
                }
                {
                matches = [ { app-id = "^(zenity)$"; } ];
                tiled-state = false;
                }
                {
                matches = [ { app-id = "^(org.gnome.TextEditor)$"; } ];
                tiled-state = false;
                }
                {
                matches = [ { app-id = "^(org.gnome.Nautilus)$"; } ];
                tiled-state = false;
                }
                {
                matches = [ { app-id = "^(io.github.celluloid_player.Celluloid)$"; } ];
                tiled-state = false;
                }
                {
                matches = [ { app-id = "^(it.mijorus.smile)$"; } ];
                tiled-state = false;
                }
                # fcitx pseudo not directly translatable
                {
                matches = [ { title = "pavucontrol"; } ];
                tiled-state = false;
                }
                {
                matches = [ { title = "Waylyrics"; } ];
                tiled-state = false;
                draw-border-with-background = false;  # Approximate noborder/noshadow
                default-floating-position = { x = 0.2; y = 0.8; relative-to = "bottom-left"; };
                }
                # Note: Niri uses app-id instead of class; adjust if needed. No noblur, noshadow directly.
            ];

            spawn-at-startup = [
                { argv = [ "swww" "init" ]; }
                { argv = [ "swww" "img" "${flakePath}/assets/nixos-anime-wallpaper.png" ]; }
                { argv = [ "swaync" ]; }
                { argv = [ "waybar" ]; }
                { argv = [ "wl-paste" "--type" "text" "--watch" "cliphist" "store" ]; }
                { argv = [ "wl-paste" "--type" "image" "--watch" "cliphist" "store" ]; }
                { argv = [ "fcitx5" "-d" "-r" ]; }
                { argv = [ "blueman-applet" ]; }
                #{ sh = "${flakePath}/scripts/startup-apps.sh"; }
            ];

            binds = {
                "Mod+V".action.spawn-sh = "cliphist list | wofi --dmenu | cliphist decode | wl-copy";

                "Mod+Return".action.spawn = "kitty";
                "Mod+Q".action.close-window = {};
                "Mod+M".action.fullscreen-window = {};
                "Mod+E".action.spawn = "nautilus";
                "Mod+F".action.toggle-window-floating = {};
                "Mod+S".action.spawn = "anyrun";
                # No pseudo, togglesplit
                "Mod+Tab".action.spawn = "swaync-client -t";
                "Mod+L".action.spawn = "wlogout";

                # Focus
                "Mod+Left".action.focus-column-left = {};
                "Mod+Right".action.focus-column-right = {};
                "Mod+Up".action.focus-window-up = {};
                "Mod+Down".action.focus-window-down = {};

                # Move/Swap
                "Mod+Shift+Left".action.move-column-left = {};
                "Mod+Shift+Right".action.move-column-right = {};
                "Mod+Shift+Up".action.move-window-up = {};
                "Mod+Shift+Down".action.move-window-down = {};

                # Resize (proportions in Niri)
                "Mod+Ctrl+Left".action.set-column-width = "-5%";  # Approximate -60 pixels
                "Mod+Ctrl+Right".action.set-column-width = "+5%";
                "Mod+Ctrl+Up".action.set-window-height = "-5%";
                "Mod+Ctrl+Down".action.set-window-height = "+5%";

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
                "Mod+Z".action.focus-workspace-down = {};  # Approximate toggle special

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
                "Mod+Shift+Z".action.move-column-to-workspace-down = {};

                # Workspace scroll with mouse
                "Mod+WheelScrollDown".action.focus-workspace-down = {};
                "Mod+WheelScrollUp".action.focus-workspace-up = {};

                # Screenshots
                "Print".action.spawn-sh = "grim - | swappy -f -";
                "Mod+Print".action.spawn-sh = "grim - | wl-copy";
                "Ctrl+Alt+A".action.spawn-sh = "grim -g \"$(slurp)\" - | swappy -f -";
                "Mod+A".action.spawn-sh = "grim -g \"$(slurp)\" - | wl-copy";

                # Waybar signals
                "Mod+B".action.spawn = [ "pkill" "-SIGUSR1" "waybar" ];
                "Mod+W".action.spawn = [ "pkill" "-SIGUSR2" "waybar" ];

                # Cycle next
                "Alt+Tab".action.focus-window-down = {};  # Approximate cyclenext
                # bringactivetotop no direct

                # App shortcuts
                "Mod+Period".action.spawn = "smile";

                # Mouse binds (using button actions)
                #"Mod+MouseLeft".action.move-window = {};
                #"Mod+MouseRight".action.resize-window = {};
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