{
  imports = [
    ./hardware.nix
    ./packages.nix
  ];

  # Powersaving matters!
  services.power-profiles-daemon.enable = true;
}