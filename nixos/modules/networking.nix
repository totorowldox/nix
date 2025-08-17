{
  # Network stuffs
  networking.networkmanager.enable = true;
  #networking.networkmanager.wifi.backend = "iwd";
  networking.nameservers = [ "8.8.8.8" "4.4.4.4" ];

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [
    22
    53317 # LocalSend
  ];
  networking.firewall.allowedUDPPorts = [ 
    22
    53317
  ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
}