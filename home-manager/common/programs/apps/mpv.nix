{ config, pkgs, lib, ... }:

{
  programs.mpv = {
    enable = true;

    # 1. Scripts: Native Nixpkgs management
    # No need to manual download; Nix handles the paths and dependencies.
    scripts = with pkgs.mpvScripts; [
      uosc # Modern, minimalist UI (replaces the old OSC)
      thumbfast # High-performance on-the-fly thumbnails
      mpris # Control mpv via system media keys/widgets
      sponsorblock # Skip YouTube sponsors automatically
      quality-menu # Easy resolution switching for web videos
      eisa01.undoredo
    ];

    # 2. Keybindings (input.conf)
    # Optimized for uosc and common workflows
    bindings = {
      # uosc menu triggers
      "menu" = "script-binding uosc/menu";
      "MBTN_RIGHT" = "script-binding uosc/menu";
      "s" = "script-binding uosc/subtitles";
      "a" = "script-binding uosc/audio";
      "q" = "script-binding uosc/stream-quality";
      "p" = "script-binding uosc/items"; # playlist

      # Quality of life
      "WHEEL_UP" = "seek 10";
      "WHEEL_DOWN" = "seek -10";
      "RIGHT" = "seek 5";
      "LEFT" = "seek -5";
      "ALT+z" = "add sub-scale -0.1";
      "ALT+x" = "add sub-scale +0.1";

      # Balanced upscaling profile
      "CTRL+1" = ''
        no-osd change-list glsl-shaders set "~~/shaders/Anime4K_Restore_CNN_Soft_L.glsl:~~/shaders/Anime4K_Upscale_CNN_x2_L.glsl"; show-text "Anime4K: Balanced"'';

      # Balanced Denoise
      "CTRL+2" = ''
        no-osd change-list glsl-shaders set "~~/shaders/Anime4K_Restore_CNN_Soft_L.glsl:~~/shaders/Anime4K_Upscale_Denoise_CNN_x2_L.glsl"; show-text "Anime4K: Balanced Denoise"'';

      # Heavy Denoise
      "CTRL+3" = ''
        no-osd change-list glsl-shaders set "~~/shaders/Anime4K_Clamp_Highlights.glsl:~~/shaders/Anime4K_Restore_CNN_Soft_L.glsl:~~/shaders/Anime4K_Upscale_Denoise_CNN_x2_L.glsl"; show-text "Anime4K: Heavy Restore"'';

      # Clear all shaders
      "CTRL+0" =
        ''no-osd change-list glsl-shaders clr ""; show-text "Shaders Cleared"'';

    };

    # 3. Main Configuration (mpv.conf)
    config = {
      # Performance & Video Output
      vo = "gpu-next"; # The modern, faster video output driver
      gpu-api = "vulkan"; # Use Vulkan for better performance on Linux
      hwdec = "auto-safe"; # Hardware decoding
      profile = "high-quality"; # Basis for high-end scaling

      # UI Customization
      osc = "no"; # Disable default OSC for uosc
      osd-bar = "no"; # Disable default progress bar
      border = "no"; # Window decorations (let your WM handle it)
      cursor-autohide = 1000;

      # Subtitles
      sub-auto = "fuzzy";
      sub-font = lib.mkForce "Noto Sans CJK JP";
      sub-font-size = 36;

      # Networking
      ytdl-format = "bestvideo[height<=?1440]+bestaudio/best";
      cache = "yes";
      demuxer-max-bytes = "500MiB";
      demuxer-max-back-bytes = "200MiB";

      save-position-on-quit = "yes";
    };

    # 4. Profiles (Conditional Settings)
    profiles = {
      # Auto-apply high quality for 4K content
      "4k-boost" = {
        profile-cond = "width >= 3840";
        debayer = "no";
      };

      # Low latency for web streams
      "fast" = {
        vo = "gpu";
        hwdec = "auto";
      };
    };
  };

  # 5. Advanced: Shaders (FSRCNNX / SSimSuperRes)
  # This links high-end shaders from Nixpkgs into your mpv config
  home.file.".config/mpv/shaders".source =
    "${pkgs.mpv-shim-default-shaders}/share/mpv-shim-default-shaders/shaders";
}
