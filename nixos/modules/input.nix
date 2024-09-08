{ config, pkgs, ... } : {
	
	i18n.inputMethod = {
		enabled = "fcitx5";
		fcitx5.waylandFrontend = true;
		fcitx5.plasma6Support = true;
		fcitx5.addons = with pkgs; [
			fcitx5-gtk
			fcitx5-rime
			fcitx5-mozc
			fcitx5-chinese-addons
			fcitx5-pinyin-moegirl
			fcitx5-nord
		];
	};

	services.libinput.enable = true;
}
