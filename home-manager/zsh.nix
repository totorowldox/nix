{ pkgs, config, ... }: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    sessionVariables = {
    };

    shellAliases =
      let
        flakeDir = "~/nix";
        hostname = "remoaku";
        username = "remo";
      in {
      
      # NixOS System
      rbs = "sudo nixos-rebuild switch --flake ${flakeDir}/#${hostname}";
      hms = "home-manager switch --flake ${flakeDir}/#${username}";
      upd = "sudo nix flake update ${flakeDir}";
      upg = "sudo nixos-rebuild switch --upgrade --flake ${flakeDir}/#${hostname}";
      cdn = "cd ~/nix";

      conf = "vim ${flakeDir}/nixos/configuration.nix";
      pkgs = "vim ${flakeDir}/nixos/packages.nix";

      ll = "ls -l";
      v = "nvim";
      hg = "history | grep";
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

    history.size = 10000;
    history.path = "${config.xdg.dataHome}/zsh/history";

    plugins = [
      {
        name = "zsh-nix-shell";
        file = "nix-shell.plugin.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "chisui";
          repo = "zsh-nix-shell";
          rev = "v0.8.0";
          sha256 = "1lzrn0n4fxfcgg65v0qhnj7wnybybqzs4adz7xsrkgmcsr0ii8b7";
        };
      }
    ];

    oh-my-zsh = {
      enable = true;
      plugins = [ 
        "extract"
        "git" 
        "sudo"
        ];
      theme = "bira"; # gnzh, blinks is also really nice
    };
  };
}
