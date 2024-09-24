{ config, ... }: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    sessionVariables = {
      #GTK_IM_MODULE = "fcitx";
      QT_IM_MODULE = "fcitx";
      SDL_IM_MODULE = "fcitx";
      XMODIFIERS = "@im=fcitx";
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

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "sudo" ];
      theme = "bira"; # gnzh, blinks is also really nice
    };
  };
}
