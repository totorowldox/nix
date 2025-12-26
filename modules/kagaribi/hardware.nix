{pkgs, config, ...} : {
  boot.supportedFilesystems = [ "ntfs" ];

  hardware.bluetooth.enable = true;
  
  services.udisks2.enable = true;
  hardware = {
    graphics.enable = true;
    graphics.enable32Bit = true;
    graphics.extraPackages = with pkgs; [
      nvidia-vaapi-driver
      #intel-media-driver # Recommended only with Intel iGPU
    ];

    nvidia = {
      open = true; # Compatible with RTX 2080 Super and newer
      nvidiaSettings = false; # GUI tool for NVIDIA settings but useless on Wayland
      modesetting.enable = true; # Mandatory for Wayland
      powerManagement.enable = false;
      powerManagement.finegrained = false;
      # https://github.com/NixOS/nixpkgs/blob/staging-25.05/pkgs/os-specific/linux/nvidia-x11/default.nix
      #package = config.boot.kernelPackages.nvidiaPackages.production; # "570.153.02"
      # https://github.com/NixOS/nixpkgs/blob/master/pkgs/os-specific/linux/nvidia-x11/default.nix
    };
  };
  services.xserver.videoDrivers = [ "nvidia" ];
  services.gvfs.enable = true;
}
