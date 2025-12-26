{ config, pkgs, ... }: {

  home = {
    username = "remo";
    homeDirectory = "/home/remo";
    stateVersion = "24.05";
  };

  xdg.userDirs = {
    enable = true;
    createDirectories = true;
  };
}
