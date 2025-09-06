{ inputs, pkgs, ... } : {
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
        closeOnClick = true;
    };
    extraCss = builtins.readFile (./. + "/styles/anyrun.css");
    extraConfigFiles = {
        "applications.ron".text = ''
            Config(
                max_entries: 5,
                terminal: Some("kitty"),
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