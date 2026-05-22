{ hostname, ... }: {
  imports = [ ./hardware.nix ];

  networking.hostName = hostname;

  system.stateVersion = "24.05";
}
