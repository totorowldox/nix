{ hostname, ... }: {
  imports = [ ./hardware.nix ];

  networking.hostName = hostname;

  system.stateVersion = "25.11";
}
