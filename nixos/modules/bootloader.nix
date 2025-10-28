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
    minegrub-theme = {
      enable = true;
      splash = "100% Declarative!";
      background = "background_options/1.8  - [Classic Minecraft].png";
      boot-options-count = 4;
    };
  };
  stylix.targets.grub.enable = false;

  boot.initrd.kernelModules = [ "amdgpu" "rtw88_8821cu" ];
}
