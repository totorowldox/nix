{ inputs, ... } : {

  imports = [
      ./hardware-configuration.nix
      ./packages.nix
      ./modules/bundle.nix
    ];
    
    #disabledModules = [
    #  ./modules/xserver.nix
    #];

    
  nixpkgs.config.allowUnfree = true; # Allow unfree packages

  networking.hostName = "remoaku"; # Hostname
    
  programs.appimage.binfmt = true; # Allow AppImages to run seamlessly... why not working?
  
  nix.settings.substituters = ["https://mirrors.ustc.edu.cn/nix-channels/store"]; # Substituters
    
  nix.settings.experimental-features = ["nix-command" "flakes"]; # Enable flakes

  time.timeZone = "Asia/Shanghai"; # Timezone

  # Localization stuffs...
  i18n.defaultLocale = "zh_CN.UTF-8";
  i18n.extraLocaleSettings = {
    #LC_ALL = "C"; # For WPF apps(wine)
    LC_ADDRESS = "zh_CN.UTF-8";
    LC_IDENTIFICATION = "zh_CN.UTF-8";
    LC_MEASUREMENT = "zh_CN.UTF-8";
    LC_MONETARY = "zh_CN.UTF-8";
    LC_NAME = "zh_CN.UTF-8";
    LC_NUMERIC = "zh_CN.UTF-8";
    LC_PAPER = "zh_CN.UTF-8";
    LC_TELEPHONE = "zh_CN.UTF-8";
    LC_TIME = "zh_CN.UTF-8";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable hyprlock
  security.pam.services.hyprlock = {};
  
  system.stateVersion = "24.05"; # Don't modify this bro

}
