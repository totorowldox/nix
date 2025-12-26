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
}

