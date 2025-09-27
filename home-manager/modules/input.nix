{ pkgs, ... }: {
  i18n.inputMethod = {
    type = "fcitx5";
    enable = true;
    fcitx5.waylandFrontend = true;
    fcitx5.addons = with pkgs; [
      fcitx5-gtk
      fcitx5-configtool
      fcitx5-rime
      rime-data
      #librime
      fcitx5-mozc
      fcitx5-chinese-addons
      #fcitx5-pinyin-moegirl
      #rime-ice
      #rime-moegirl
    ];
  };
}
