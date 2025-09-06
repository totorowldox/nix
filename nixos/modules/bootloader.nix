{
  # Choose one bootloader.
  boot.loader.grub.enable = true;
  boot.loader.systemd-boot.enable = false;

  boot.loader.efi = {
    canTouchEfiVariables = true;
    efiSysMountPoint = "/boot";
  };

  boot.loader.grub = {
    efiSupport = true;
    useOSProber = true;
    copyKernels = true;
    devices = [ "nodev" ];
  };
  stylix.targets.grub.enable = true;

  boot.initrd.kernelModules = [ "amdgpu" "rtw88_8821cu" ];
}


# {config, ...} : {
#   # Bootloader.
#   boot.loader.grub.enable = false;
#   boot.loader.systemd-boot.enable = true;
#   boot.loader.efi.canTouchEfiVariables = true;
#   boot.initrd.kernelModules = [ "amdgpu" ];
#   #boot.loader.grub.enable = true;
#   #boot.loader.grub.efiSupport = true;
#   #boot.loader.grub.useOSProber = true;
#   #boot.loader.grub.devices = [ "nodev" ];
# }


