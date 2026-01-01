{ vars, ... }: {
  programs.fastfetch = {
    enable = true;

    settings = {
      display = {
        separator = "   "; # Cleaner separator
        color = {
          keys = "magenta";
          output = "white"; # Brighter output for better readability
        };
      };

      logo = {
        source = "${vars.flakePath}/assets/nix-chan.png";
        type = "kitty-direct";
        width = 45;
        height = 18;
        padding = {
          top = 2;
          left = 4;
        };
      };

      modules = [
        "title"
        {
          type = "custom";
          format = "─────────────────────────────────────────────────────";
        }
        {
          type = "os";
          key = "󱄅 OS";
        }
        {
          type = "kernel";
          key = "󰌽 Kernel";
        }
        {
          type = "packages";
          key = "󰏖 PKG";
        }
        {
          type = "shell";
          key = " SH";
        }
        "break"
        {
          type = "cpu";
          key = " CPU";
          # Show frequency and cores for more "pro" look
          format = "{1} ({3}) @ {7}";
        }
        {
          type = "gpu";
          key = "󰍛 GPU";
        }
        {
          type = "memory";
          key = "󰑭 RAM";
          format = "{1} / {2} ({3})";
        }
        "break"
        {
          type = "wm";
          key = " WM";
        }
        {
          type = "terminal";
          key = " TER";
        }
        "break"
        {
          type = "command";
          key = "󱘖 AGE";
          text =
            "birth_install=$(stat -c %W /); current=$(date +%s); echo $(((current - birth_install) / 86400)) days";
        }
        {
          type = "uptime";
          key = " UP ";
        }
        "break"
        # The "Secret Sauce": A color palette strip
        {
          type = "colors";
          symbol = "circle"; # Can be "circle", "square", or "block"
        }
      ];
    };
  };
}
