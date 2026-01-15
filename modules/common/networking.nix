{ pkgs, ... }: {
  # Network stuffs
  networking.networkmanager.enable = true;
  #networking.networkmanager.wifi.backend = "iwd";
  networking.nameservers = [ "8.8.8.8" "4.4.4.4" ];
  networking.nat.enable = true; # Enable NAT for container
  networking.nat.internalInterfaces = [ "waydroid0" ];

  environment.etc."resolv.conf".text = ''
    nameserver 8.8.8.8
    nameserver 4.4.4.4
    options edns0
  '';

  # Enable tailscale service
  services.tailscale.enable = true;

  # Enable bluetooth
  services.blueman.enable = true;

  # Enable the OpenSSH daemon.
  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      PermitRootLogin = "prohibit-password";
    };
  };

  # Enable Sunshine service
  services.sunshine = {
    enable = true;
    autoStart = true;
    capSysAdmin = true;
    openFirewall = true;

  };

  # Open ports in the firewall.
  networking.firewall = let
    localRange = "192.168.0.0/24";
    openToLocalPorts = [ ];
    openToWANPorts = [
      53317 # LocalSend
      7789 # Ani-RSS
    ];
  in {

    enable = true;

    allowedTCPPorts = openToWANPorts;
    allowedUDPPorts = openToWANPorts;

    # extraCommands = ''
    #   nft 'flush table inet nixos-fw'
    #   nft 'add table inet nixos-fw'
    #   nft 'add chain inet nixos-fw input { type filter hook input priority 0 ; policy drop ; }'
    #   nft 'add rule inet nixos-fw input iif lo accept'
    #   nft 'add rule inet nixos-fw input ct state established,related accept'
    #   nft 'add rule inet nixos-fw input ip saddr ${localRange} dport { ${builtins.concatStringsSep ", " (map toString openToLocalPorts)} } accept'
    #   nft 'add rule inet nixos-fw input log prefix "dropped: " drop'
    # '';
  };
}
