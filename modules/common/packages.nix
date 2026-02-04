{ pkgs, inputs, ... }: {

  nixpkgs.config.allowUnfree = true;

  nixpkgs.config.permittedInsecurePackages = [ "immersive-translate-1.22.4" ];

  services.flatpak.enable = true;

  services.atd.enable = true;

  services.samba.enable = true;

  programs.clash-verge.enable = true;

  environment.systemPackages = let
    qq-x11 = pkgs.symlinkJoin {
      name = "qq-x11";
      paths = [ pkgs.qq ];
      buildInputs = [ pkgs.makeWrapper ];
      postBuild = ''
        wrapProgram $out/bin/qq \
        	--add-flags "--ozone-platform=x11"
      '';
    };

  in with pkgs; [
    # Desktop Apps
    firefox
    wofi
    mpv
    celluloid # GUI-fied mpv
    gparted # Disk manager
    rustdesk-flutter
    waylyrics # Lyrics displayer
    localsend # LAN file sharing tool
    libreoffice
    jiten # CLI Japanese dictionary
    nautilus # File manager
    gedit # Text editor
    smile # Emoji picker
    musescore # Music score engraving app
    mission-center # Resource management
    tailscale-systray
    notepad-next
    obs-studio
    loupe

    # SMS
    qq
    signal-desktop
    telegram-desktop

    # Windows program runner
    wineWowPackages.stable
    winetricks
    protonup-qt

    # Coding
    vscode
    gcc
    gdb
    just
    devenv
    nixfmt-classic
    qwen-code
    #jetbrains.rider

    # CLI stuffs
    fastfetch
    tree
    go-musicfox
    cmd-wrapped
    fzf
    tmux
    eza # better ls
    nh # better nix cli
    lazygit # better git TUI
    ripgrep
    jq
    calcure
    # witr

    # Terminal
    # alacritty
    kitty # For image support

    # Utils
    pavucontrol
    zip
    unzip
    usb-modeswitch
    usbutils

    # WMs and stuff
    # waybar
    # (waybar.overrideAttrs (oldAttrs: {
    #   mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
    # }))

    # Wallpaper
    swww
    mpvpaper

    # Notification Controller
    libnotify
    swaynotificationcenter

    # Wayland Stuff
    xwayland
    wl-clipboard
    #cliphist

    # Theming Stuff
    sassc
    #gtk-engine-murrine
    #gnome-themes-extra

    # Screenshotting
    grim
    slurp
    swappy
    wayfreeze

    # Others
    home-manager
    cachix
    nur.repos.ataraxiasjel.waydroid-script
    hyperhdr
    mesa
    libglvnd
    egl-wayland

    # Security
    polkit_gnome
    kdePackages.kleopatra
    gnupg
    pinentry-gnome3

    # XDG portal
    # xdg-desktop-portal-gtk
  ];
}
