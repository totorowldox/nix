{ inputs, hostname, ... }: {

  imports = [ ./hardware.nix ];

  nixpkgs.config.allowUnfree = true; # Allow unfree packages

  networking.hostName = hostname; # Hostname

  programs.appimage.enable = true;
  programs.appimage.binfmt =
    true; # Allow AppImages to run seamlessly... why not working?

  nix.settings.builders-use-substitutes = true;

  nix.settings.substituters = [
    "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
    "https://mirrors.ustc.edu.cn/nix-channels/store"
    "https://catppuccin.cachix.org"
    "https://devenv.cachix.org"
    "https://cache.nixos.org/"
  ];

  nix.settings.extra-trusted-public-keys = [
    "devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw="
    "catppuccin.cachix.org-1:noG/4HkbhJb+lUAdKrph6LaozJvAeEEZj4N732IysmU="
    "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
  ];

  nix.settings.experimental-features =
    [ "nix-command" "flakes" ]; # Enable flakes

  time.timeZone = "Asia/Shanghai"; # Timezone

  # Localization stuffs...
  i18n.defaultLocale = "zh_CN.UTF-8";
  i18n.extraLocaleSettings = {
    #LC_ALL = "zh_CN.UTF-8";
    #LC_ALL = "C"; # For WPF apps(wine)
    LC_ADDRESS = "zh_CN.UTF-8";
    LC_IDENTIFICATION = "zh_CN.UTF-8";
    LC_MEASUREMENT = "zh_CN.UTF-8";
    LC_MESSAGES = "ja_JP.UTF-8";
    LC_MONETARY = "zh_CN.UTF-8";
    LC_NAME = "zh_CN.UTF-8";
    LC_NUMERIC = "zh_CN.UTF-8";
    LC_PAPER = "zh_CN.UTF-8";
    LC_TELEPHONE = "zh_CN.UTF-8";
    LC_TIME = "ja_JP.UTF-8";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable hyprlock
  security.pam.services.hyprlock = { };

  system.stateVersion = "25.11"; # Don't modify this bro
}
