{ config, ... }: {
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    matchBlocks = {
      "*" = {
        identityAgent = "${config.home.homeDirectory}/.1password/agent.sock";
      };
    };
    extraConfig = "";
  };

  home.file.".ssh/authorized_keys".text = ''
    ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIN6mBjCZKta7fjJ1AEzVvwOxJymlaRVnbsXomjllAkko Login
  '';
}

