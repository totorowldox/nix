{
  # Choose one bootloader.
  boot.loader.grub.enable = true;
  boot.loader.systemd-boot.enable = false;
  boot.plymouth.enable = true;
  boot.initrd.systemd.enable = true;
  boot.consoleLogLevel = 0;
  boot.initrd.verbose = false;

  boot.kernelParams = [
    "quiet"
    "splash"
    "boot.shell_on_fail"
    "rd.systemd.show_status=false"
    "rd.udev.log_level=3"
    "udev.log_priority=3"
  ];
  boot.loader.efi = {
    canTouchEfiVariables = true;
    efiSysMountPoint = "/boot";
  };

  boot.loader.grub = {
    efiSupport = true;
    useOSProber = true;
    copyKernels = true;
    default = "saved";
    extraConfig = ''
      save_default
    '';
    devices = [ "nodev" ];
  };
}
