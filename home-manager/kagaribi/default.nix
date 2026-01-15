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

  programs.ssh.matchBlocks."remoaku" = { forwardAgent = true; };
}
