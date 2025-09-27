{ pkgs, inputs, ... }: {

  nixpkgs.config.allowUnfree = true;

  services.flatpak.enable = true;

  services.atd.enable = true;

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
    clash-nyanpasu
    libreoffice
    jiten # CLI Japanese dictionary
    nautilus # File manager
    gedit # Text editor
    smile # Emoji picker
    musescore # Music score engraving app
    mission-center # Resource management
    tailscale-systray
    notepad-next

    # SMS
    qq-x11
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
    direnv
    nixfmt-classic
    #jetbrains.rider

    # CLI stuffs
    thefuck
    fastfetch
    tree
    go-musicfox
    cmd-wrapped
    fzf
    tmux
    zoxide # better cd
    eza # better ls
    nh # better nix cli
    lazygit # better git TUI
    ripgrep

    # Terminal
    # alacritty
    kitty # For image support

    # Utils
    pavucontrol
    waydroid
    zip
    unzip
    usb-modeswitch
    usbutils

    # WMs and stuff
    waybar
    (waybar.overrideAttrs (oldAttrs: {
      mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
    }))

    # Wallpaper
    swww
    mpvpaper

    # Notification Controller
    libnotify
    swaynotificationcenter

    # Wayland Stuff
    xwayland
    wl-clipboard
    cliphist

    # Theming Stuff
    sassc
    #gtk-engine-murrine
    #gnome-themes-extra

    # Screenshotting
    grim
    grimblast
    slurp
    flameshot
    swappy

    # Others
    home-manager
    cachix

    # Security
    polkit_gnome
    libsForQt5.kleopatra
    gnupg
    pinentry
    pinentry-gnome3

    # XDG portal
    # xdg-desktop-portal-gtk
  ];
}
