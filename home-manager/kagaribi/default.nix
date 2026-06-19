{ config, pkgs, lib, ... }: {
  imports = [ ./programs ];

  home = {
    username = "remo";
    homeDirectory = "/home/remo";
    stateVersion = "25.11";
  };

  xdg.userDirs = {
    enable = true;
    createDirectories = true;
    setSessionVariables = true;
  };

  programs.ssh.settings = {
    "Match host remoaku" = {
      HostName = "100.64.0.6";
      ForwardAgent = "yes";
    };
  };
  programs.niri.settings = {
    debug = { render-drm-device = "/dev/dri/renderD129"; };
    animations = {

    };
  };
}
