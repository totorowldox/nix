{ pkgs, ... }: {
  gtk = {
    enable = true;
    # theme = {
    #     package = pkgs.orchis-theme;
    #     name = "Orchis-Pink-Dark";
    # };
    iconTheme = {
      package = pkgs.tela-icon-theme;
      name = "Tela-purple";
    };
  };
}
