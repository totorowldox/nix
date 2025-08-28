{
  # Network stuffs
  networking.networkmanager.enable = true;
  #networking.networkmanager.wifi.backend = "iwd";
  networking.nameservers = [ "8.8.8.8" "4.4.4.4" ];

  # Enable tailscale service
	services.tailscale.enable = true;

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [
    22
    53317 # LocalSend
    7789 # Ani-RSS
  ];
  networking.firewall.allowedUDPPorts = [ 
    22
    53317
    7789 # Ani-RSS
  ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
}