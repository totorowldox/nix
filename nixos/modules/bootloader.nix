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
