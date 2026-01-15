{ config, pkgs, ... }: {

  home = {
    username = "remo";
    homeDirectory = "/home/remo";
    stateVersion = "25.11";
  };

  xdg.userDirs = {
    enable = true;
    createDirectories = true;
  };

  programs.ssh.matchBlocks."remoaku" = {
    hostname = "100.64.0.6";
    forwardAgent = true;
  };
}
