{ pkgs, ... }: {
  i18n.inputMethod = {
    type = "fcitx5";
    enable = true;
    fcitx5.waylandFrontend = true;
    fcitx5.settings.inputMethod = {
      GroupOrder."0" = "Default";
      "Groups/0" = {
        Name = "Default";
        "Default Layout" = "us";
        DefaultIM = "rime";
      };
      "Groups/0/Items/0".Name = "keyboard-us";
      "Groups/0/Items/1".Name = "rime";
      "Groups/0/Items/2".Name = "mozc";
    };
    fcitx5.addons = with pkgs; [
      fcitx5-gtk
      qt6Packages.fcitx5-configtool
      fcitx5-rime
      rime-data
      #librime
      fcitx5-mozc
      qt6Packages.fcitx5-chinese-addons
      #fcitx5-pinyin-moegirl
      #rime-ice
      #rime-moegirl
    ];
  };
}
