{ vars, ... }: {
  programs = {
    nushell = {
      enable = true;
      # for editing directly to config.nu 
      extraConfig = ''
        let carapace_completer = {|spans|
        carapace $spans.0 nushell $spans | from json
        }
        $env.config = {
            show_banner: false,
            completions: {
            case_sensitive: false # case-sensitive completions
            quick: true    # set to false to prevent auto-selecting completions
            partial: true    # set to false to prevent partial filling of the prompt
            algorithm: "fuzzy"    # prefix or fuzzy
            external: {
            # set to false to prevent nushell looking into $env.PATH to find more suggestions
                enable: true 
            # set to lower can improve completion performance at the cost of omitting some options
                max_results: 100 
                completer: $carapace_completer # check 'carapace_completer' 
            }
            }
        } 
        $env.PATH = ($env.PATH | 
        split row (char esep) |
        prepend /home/myuser/.apps |
        append /usr/bin/env
        )
      '';

      shellAliases = let
        hostname = "remoaku";
        username = "remo";
      in {
        # NixOS System
        rbs = "sudo nixos-rebuild switch --flake ${vars.flakePath}/#${hostname}";
        hms = "home-manager switch --flake ${vars.flakePath}/#${username}";
        upd = "sudo nix flake update ${vars.flakePath}";
        upg =
          "sudo nixos-rebuild switch --upgrade --flake ${vars.flakePath}/#${hostname}";
        cdn = "cd ${vars.flakePath}";

        conf = "vim ${vars.flakePath}/nixos/configuration.nix";
        pkgs = "vim ${vars.flakePath}/nixos/packages.nix";

        ll = "ls -l";
        v = "nvim";
        se = "sudoedit";
        ff = "fastfetch --logo-type builtin --logo nix-old";

        # Wine
        w32 = "wine";
        wt = "winetricks";

        # Windows drivers/directories
        cdc = "cd /media/windows/c";
        cdd = "cd /media/windows/d";
        cde = "cd /media/windows/e";
        cdg = "cd /media/windows/g";
        cdgal = "cd /media/windows/e/GAL";
      };
    };
    carapace.enable = true;
    carapace.enableNushellIntegration = true;

    starship = {
      enable = true;
      settings = {
        add_newline = true;
        character = {
          success_symbol = "[➜](bold green)";
          error_symbol = "[➜](bold red)";
        };
      };
    };
  };
}
