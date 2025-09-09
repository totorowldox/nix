{ inputs, config, pkgs, ... }: {
  programs.anyrun = {
    enable = true;
    package = inputs.anyrun.packages.${pkgs.system}.anyrun;
    config = {
      plugins = with inputs.anyrun.packages.${pkgs.system}; [
        applications
        rink
        symbols
        shell
        stdin
      ];
      width.fraction = 0.4;
      y.fraction = 0.3;
      hidePluginInfo = false;
      hideIcons = false;
      closeOnClick = false;
    };
    extraCss = ''
window {
  background: transparent;
}

box.main {
  padding: 5px;
  margin: 10px;
  border-radius: 10px;
  border: 2px solid ${config.lib.stylix.colors.withHashtag.base01};
  background-color: ${config.lib.stylix.colors.withHashtag.base00};
  box-shadow: 0 0 5px black;
}


text {
  min-height: 30px;
  padding: 5px;
  border-radius: 5px;
  font-color: ${config.lib.stylix.colors.withHashtag.base05};
}

.matches {
  background-color: rgba(0, 0, 0, 0);
  border-radius: 10px;
  font-color: ${config.lib.stylix.colors.withHashtag.base05};
}

box.plugin:first-child {
  margin-top: 5px;
}

box.plugin.info {
  min-width: 200px;
}

list.plugin {
  background-color: rgba(0, 0, 0, 0);
}

label.match.description {
  font-size: 14px;
  olor: ${config.lib.stylix.colors.withHashtag.base04};
}

label.plugin.info {
  font-size: 18px;
}

.match {
  background: transparent;
}

.match:selected {
  border-left: 3px solid ${config.lib.stylix.colors.withHashtag.base02};
  background: transparent;
  transition: all 0.1s ease-in-out
}

@keyframes fade {
  0% {
    opacity: 0;
  }

  100% {
    opacity: 1;
  }
}
    '';

    extraConfigFiles = {
      "applications.ron".text = ''
        Config(
            desktop_actions: true,
            max_entries: 5,
            terminal: Some(Terminal(
              command: "kitty",
              args: "{}",
            )),
        )
      '';

      "shell.ron".text = ''
        Config(
            prefix: ">"
        )
      '';
    };
  };
}
