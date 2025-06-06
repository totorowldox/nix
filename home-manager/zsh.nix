{ pkgs, config, ... }: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    sessionVariables = {
      FZF_DEFAULT_OPTS=''
--color=bg+:#363a4f,bg:#24273a,spinner:#f4dbd6,hl:#ed8796 \
--color=fg:#cad3f5,header:#ed8796,info:#c6a0f6,pointer:#f4dbd6 \
--color=marker:#b7bdf8,fg+:#cad3f5,prompt:#c6a0f6,hl+:#ed8796 \
--color=selected-bg:#494d64 \
--prompt='$' \
--pointer='🍥' \
--border=double '';
#--multi

    };

    # Custom shell scripts
    initContent = ''
    function y() {
      local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
      yazi "$@" --cwd-file="$tmp"
      if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        builtin cd -- "$cwd"
      fi
      rm -f -- "$tmp"
    }
    function fzf-history() {
      local selected_command=$(history | awk '{$1=""; sub(/^ */, ""); if (!seen[$0]++) print $0}' | fzf -i \
        --ansi \
        --reverse \
        --height=50% \
        --margin=2%,2%,2%,2% \
        --layout=reverse-list \
        --info=default \
        --header='Select command to execute, CTRL-C or ESC to quit')
      if [[ -n $selected_command ]]; then
        BUFFER=$selected_command
        CURSOR=$#BUFFER
        zle accept-line
      fi
    }

    zle -N fzf-history
    bindkey '^R' fzf-history

    eval "$(zoxide init zsh)"

    eval "$(direnv hook zsh)"

    eval $(thefuck --alias)

    '';

    shellAliases =
      let
        flakeDir = "~/nix";
        hostname = "remoaku";
        username = "remo";
        sudoWithEnvVars = "HOME=/ sudo -E";
      in {
      
      # NixOS System
      rbs = "${sudoWithEnvVars} nixos-rebuild switch --flake ${flakeDir}/#${hostname}";
      hms = "home-manager switch --flake ${flakeDir}/#${username}";

      upd = "${sudoWithEnvVars} nix flake update --flake ${flakeDir}";
      upg = "${sudoWithEnvVars} nixos-rebuild switch --upgrade --flake ${flakeDir}/#${hostname}";
      
      cdn = "cd ~/nix";
      conf = "vim ${flakeDir}/nixos/configuration.nix";
      pkgs = "vim ${flakeDir}/nixos/packages.nix";

      # NixOS
      getUrlHash = "nix-prefetch-url --unpack";

      # CLI
      cd = "z";
      cdi = "zi";
      v = "nvim";
      hg = "history | grep";
      se = "sudoedit";
      ff = "fastfetch --logo-type builtin --logo nix-old";

      # Wine
      wine = "WINEARCH=win32 WINEPREFIX=~/.wine wine";
      winetricks = "WINEARCH=win32 WINEPREFIX=~/.wine winetricks";
      w64 = "WINEARCH=win64 WINEPREFIX=~/.wine64 wine64";
      wt64 = "WINEARCH=win64 WINEPREFIX=~/.wine64 winetricks";

      # Windows drivers/directories
      cdc = "cd /media/windows/c";
      cdd = "cd /media/windows/d";
      cde = "cd /media/windows/e";
      cdg = "cd /media/windows/g";
      cdgal = "cd /media/windows/e/GAL";

      # Apps
      osu-lazer = ''export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7890 DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=1; appimage-run ./下载/osu.AppImage'';

      # Env Vars
      set-proxy = ''export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7890'';
    };

    history.size = 10000;
    #history.path = "${config.xdg.dataHome}/zsh/history";

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
      {
        name = "fzf-tab";
        src = pkgs.fetchFromGitHub {
          owner = "Aloxaf";
          repo = "fzf-tab";
          rev = "v1.1.2";
          sha256 = "061jjpgghn8d5q2m2cd2qdjwbz38qrcarldj16xvxbid4c137zs2";
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
