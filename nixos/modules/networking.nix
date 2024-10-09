{

  # Network stuffs
  networking.networkmanager.enable = true;
  networking.nameservers = [ "1.1.1.1" "1.0.0.1" "8.8.8.8" "4.4.4.4" ];
  

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [ 22 8000 ];
  networking.firewall.allowedUDPPorts = [ 22 8000 ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
  
}
