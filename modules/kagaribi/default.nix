{
  imports = [
    ./hardware.nix
    ./kernel-modules.nix
    ./packages.nix
  ];

  # Powersaving matters!
  services.power-profiles-daemon.enable = true;
}