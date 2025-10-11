{ lib, ... }: {
  home.sessionVariables = {
    EDITOR = "code";
    TERMNIAL = "kitty";
    BROWSER = "firefox";

    NIXOS_OZONE_WL = "1";
    QT_QPA_PLATFORMTHEME = lib.mkForce "gtk3";
  };
}
