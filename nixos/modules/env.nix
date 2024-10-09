{ pkgs, ... } : {
    environment.variables = {
        #GTK_THEME = "Catppuccin-Macchiato-Compact-Pink-Dark";
        #QT_QPA_PLATFORMTHEME = "qt5ct";
        #SDL_VIDEODRIVER = "wayland";
        #GTK_IM_MODULE = "wayland";
        QT_IM_MODULE = "fcitx";
        GLFW_IM_MODULE = "fcitx";
        SDL_IM_MODULE = "fcitx";
        XMODIFIERS = "@im=fcitx";
    };
}
