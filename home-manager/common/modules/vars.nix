{ lib, ... }: {
  home.sessionVariables = {
    EDITOR = "code";
    TERMNIAL = "kitty";
    BROWSER = "zen-beta";

    NIXOS_OZONE_WL = "1";
    QT_QPA_PLATFORMTHEME = lib.mkForce "gtk3";
  };
}
