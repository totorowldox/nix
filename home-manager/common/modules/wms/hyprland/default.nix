{ pkgs, vars, ... }: {
  imports = [ ./waybar.nix ];

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    portalPackage = pkgs.xdg-desktop-portal-hyprland;

    plugins = with pkgs;
      [
        #hyprlandPlugins.hyprtrails
      ];

    settings = {
      "$mainMod" = "SUPER";

      #monitor = ",1920x1080@120,0x0,1";
      monitor = ", highrr, auto, 1";

      env = [
        # Session vars
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "XDG_SESSION_DESKTOP,Hyprland"

        # QT
        "QT_QPA_PLATFORM,wayland;xcb"
        "QT_AUTO_SCREEN_SCALE_FACTOR,1"

        # Cursors
        "HYPRCURSOR_THEME,catppuccin-macchiato-dark-cursors"
        "HYPRCURSOR_SIZE,36"
        "XCURSOR_SIZE,36"

        "XDG_SCREENSHOTS_DIR,~/screens"
        "SDL_VIDEODRIVER,wayland"
      ];

      #debug = {
      #  disable_logs = false;
      #  enable_stdout_logs = true;
      #};

      input = {
        kb_layout = "us";

        follow_mouse = 1;

        touchpad = { natural_scroll = false; };

        sensitivity = 0; # -1.0 - 1.0, 0 means no modification.
      };

      general = {
        gaps_in = 5;
        gaps_out = 20;
        border_size = 3;
        #"col.active_border" = "rgba(ff66b3ee) rgba(ffccffee) 45deg"; # Managed by stylix
        #"col.inactive_border" = "rgba(595959aa)";

        layout = "dwindle";
      };

      decoration = {
        rounding = 10;

        blur = {
          enabled = true;
          size = 10;
          passes = 2;
          new_optimizations = true;
        };

        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
          #color = "rgba(1a1a1aee)"; # Managed by stylix
        };

        dim_inactive = true;
        dim_strength = 0.1;
      };

      /* animations = {
           enabled = true;

           bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
           # bezier = "myBezier, 0.33, 0.82, 0.9, -0.08";

           animation = [
             "windows,     1, 7,  myBezier"
             "windowsOut,  1, 7,  default, popin 80%"
             "border,      1, 10, default"
             "borderangle, 1, 8,  default"
             "fade,        1, 7,  default"
             "workspaces,  1, 6,  default"
           ];
         };
      */

      animations = {
        enabled = true;

        bezier = [
          "myBounce, 0.05, 0.9, 0.1, 1.05"
          "fluent_decel, 0, 0.2, 0.4, 1"
          "easeOutCirc, 0, 0.55, 0.45, 1"
          "easeOutCubic, 0.33, 1, 0.68, 1"
          "easeinoutsine, 0.37, 0, 0.63, 1"
        ];
        animation = [
          "windowsIn, 1, 2, myBounce, slide" # window open
          "windowsOut, 1, 2, myBounce, slide" # window close
          "windowsMove, 1, 2, fluent_decel, slide" # everything in between, moving, dragging, resizing

          # fading
          "fadeIn, 1, 3, easeOutCubic" # fade in (open) -> layers and windows
          "fadeOut, 1, 3, easeOutCubic" # fade out (close) -> layers and windows
          "fadeSwitch, 1, 3, easeOutCirc" # fade on changing activewindow and its opacity
          "fadeShadow, 1, 5, easeOutCirc" # fade on changing activewindow for shadows
          "fadeDim, 1, 3, fluent_decel" # the easing of the dimming of inactive windows
          "border, 1, 2.7, easeOutCirc" # for animating the border's color switch speed
          "workspaces, 1, 2, fluent_decel, slide" # styles: slide, slidevert, fade, slidefade, slidefadevert
          "specialWorkspace, 1, 3, fluent_decel, slidevert"
        ];
      };

      dwindle = {
        pseudotile =
          true; # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
        preserve_split = false;
      };

      gestures = {
        workspace_swipe = true;
        workspace_swipe_fingers = 3;
        workspace_swipe_invert = false;
        workspace_swipe_distance = 200;
        workspace_swipe_forever = true;
      };

      misc = {
        animate_manual_resizes = true;
        animate_mouse_windowdragging = true;
        enable_swallow = true;
        render_ahead_of_time = false;
        disable_hyprland_logo = true;
      };

      windowrule = [
        "float, class:^(imv)$"
        "float, class:^(mpv)$"
        "float, class:^(celluloid)$"
        "float, class:^(QQ)$"
        #"center, class:^(QQ)$"
        "move 5% 10%, title:QQ"
        "float, class:^(zenity)$"
        "float, class:^(org.gnome.TextEditor)$"
        "float, class:^(org.gnome.Nautilus)$"
        "float, class:^(io.github.celluloid_player.Celluloid)$"
        "float, class:^(it.mijorus.smile)$"
        "size 10% 10%, class:^(it.mijorus.smile)$"
        "pseudo, class:fcitx"
        "float, title:pavucontrol"
        "size 15% 80%, title:QQ"
        "pin, title:Waylyrics"
        "float, title:Waylyrics"
        "noblur, title:Waylyrics"
        "noborder, title:Waylyrics"
        "noshadow, title:Waylyrics"
        "nofocus, title:Waylyrics"
        "move 20% 80%, title:Waylyrics"
      ];

      exec-once = [
        "swww init"
        "swww img ${vars.flakePath}/assets/nixos-anime-wallpaper.png"
        "swaync"
        "waybar"
        "wl-paste --type text --watch cliphist store"
        "wl-paste --type image --watch cliphist store"
        "fcitx5 -d -r"
        "${vars.flakePath}/scripts/startup-apps.sh"
        "blueman-applet"
        #"1password"
        #"fcitx5-remote -r"
      ];

      bind = [
        "$mainMod, V, exec, cliphist list | wofi --dmenu | cliphist decode | wl-copy"

        "$mainMod, Return, exec, kitty"
        "$mainMod, Q, killactive,"
        "$mainMod, M, fullscreen,"
        "$mainMod, E, exec, nautilus"
        "$mainMod, F, togglefloating"
        #"$mainMod, S, exec, wofi --show drun --term kitty"
        #"ALT, space, exec, anyrun"
        "$mainMod, S, exec, anyrun"
        "$mainMod, P, pseudo, # dwindle"
        "$mainMod, J, togglesplit, # dwindle"
        "$mainMod, Tab, exec, swaync-client -t"
        "$mainMod, L, exec, wlogout"

        # Move focus with mainMod + arrow keys
        "$mainMod, left,  movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up,    movefocus, u"
        "$mainMod, down,  movefocus, d"

        # Moving windows
        "$mainMod SHIFT, left,  swapwindow, l"
        "$mainMod SHIFT, right, swapwindow, r"
        "$mainMod SHIFT, up,    swapwindow, u"
        "$mainMod SHIFT, down,  swapwindow, d"

        # Window resizing                     X  Y
        "$mainMod CTRL, left,  resizeactive, -60 0"
        "$mainMod CTRL, right, resizeactive,  60 0"
        "$mainMod CTRL, up,    resizeactive,  0 -60"
        "$mainMod CTRL, down,  resizeactive,  0  60"

        # Switch workspaces with mainMod + [0-9]
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"
        "$mainMod, z, togglespecialworkspace"

        # Move active window to a workspace with mainMod + SHIFT + [0-9]
        "$mainMod SHIFT, 1, movetoworkspacesilent, 1"
        "$mainMod SHIFT, 2, movetoworkspacesilent, 2"
        "$mainMod SHIFT, 3, movetoworkspacesilent, 3"
        "$mainMod SHIFT, 4, movetoworkspacesilent, 4"
        "$mainMod SHIFT, 5, movetoworkspacesilent, 5"
        "$mainMod SHIFT, 6, movetoworkspacesilent, 6"
        "$mainMod SHIFT, 7, movetoworkspacesilent, 7"
        "$mainMod SHIFT, 8, movetoworkspacesilent, 8"
        "$mainMod SHIFT, 9, movetoworkspacesilent, 9"
        "$mainMod SHIFT, 0, movetoworkspacesilent, 10"
        "$mainMod SHIFT, z, movetoworkspace, special"

        # Scroll through existing workspaces with mainMod + scroll
        "$mainMod, mouse_down, workspace, e-1"
        "$mainMod, mouse_up, workspace, e+1"

        # Screenshotting
        ", Print, exec, grim - | swappy -f -"
        "$mainMod, Print, exec, grim - | wl-copy"
        ''CTRL ALT, A, exec, grim -g "$(slurp)" - | swappy -f -''
        ''$mainMod, A, exec, grim -g "$(slurp)" - | wl-copy''

        # Waybar
        "$mainMod, B, exec, pkill -SIGUSR1 waybar"
        "$mainMod, W, exec, pkill -SIGUSR2 waybar"

        # Window Controls
        "ALT, Tab, cyclenext"
        "ALT, Tab, bringactivetotop"

        # App shortcuts
        "$mainMod, period, exec, smile"

      ];

      # Move/resize windows with mainMod + LMB/RMB and dragging
      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];
    };
  };
}
