{ inputs, ... } : {

  imports = [
      ./modules

      ./hardware-configuration.nix
      ./packages.nix
    ];
    
    disabledModules = [
      "programs/anyrun.nix"
    ];

    
  nixpkgs.config.allowUnfree = true; # Allow unfree packages

  networking.hostName = "remoaku"; # Hostname

  programs.appimage.enable = true;
  programs.appimage.binfmt = true; # Allow AppImages to run seamlessly... why not working?
  
  nix.settings.builders-use-substitutes = true;

  nix.settings.substituters = [
    "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
    "https://mirrors.ustc.edu.cn/nix-channels/store"
    "https://anyrun.cachix.org"
    "https://nix-gaming.cachix.org"
    "https://devenv.cachix.org"
  ];
    
  nix.settings.extra-trusted-public-keys = [
    "anyrun.cachix.org-1:pqBobmOjI7nKlsUMV25u9QHa9btJK65/C8vnO3p346s="
    "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
    "devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw=" 
  ];

  nix.settings.experimental-features = ["nix-command" "flakes"]; # Enable flakes

  time.timeZone = "Asia/Shanghai"; # Timezone

  # Localization stuffs...
  i18n.defaultLocale = "zh_CN.UTF-8";
  i18n.extraLocaleSettings = {
    #LC_ALL = "zh_CN.UTF-8";
    #LC_ALL = "C"; # For WPF apps(wine)
    LC_ADDRESS = "zh_CN.UTF-8";
    LC_IDENTIFICATION = "zh_CN.UTF-8";
    LC_MEASUREMENT = "zh_CN.UTF-8";
    LC_MESSAGES="ja_JP.UTF-8";
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
  security.pam.services.hyprlock = {};
  
  system.stateVersion = "24.05"; # Don't modify this bro

}
