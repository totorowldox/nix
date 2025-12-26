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

  fileSystems."/media/windows/c" = {
    device = "/dev/disk/by-uuid/227CBA057CB9D42F";
    fsType = "ntfs-3g";
    options = [ "uid=1000" "gid=100" "rw" "user" "exec" "umask=000" ];
  };

  fileSystems."/media/windows/d" = {
    device = "/dev/disk/by-uuid/2888BA5A88BA266A";
    fsType = "ntfs-3g";
    options = [ "uid=1000" "gid=100" "rw" "user" "exec" "umask=000" ];
  };

  services.xserver.videoDrivers = [ "nvidia" ];
  services.gvfs.enable = true;
}
