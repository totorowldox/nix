{pkgs, ...} : {
    home.pointerCursor = {
    #    package = pkgs.catppuccin-cursors.macchiatoPink;
        size = 36;
        gtk.enable = true;
        x11.enable = true;
    };
    catppuccin.pointerCursor.enable = true;
    catppuccin.pointerCursor.accent = "dark";
}