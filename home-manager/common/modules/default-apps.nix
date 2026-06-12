{
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "application/x-ms-dos-executable" = [ "wine.desktop" ];
      "application/x-wine-extension-exe" = [ "wine.desktop" ];

      "application/zip" = "peazip.desktop";
      "application/vnd.rar" = "peazip.desktop";
      "application/x-7z-compressed" = "peazip.desktop";
      "application/x-compressed-tar" = "peazip.desktop";
      "application/x-xz-compressed-tar" = "peazip.desktop";
      "application/pdf" = "zen-beta.desktop";
      "text/html" = "zen-beta.desktop";
      "x-scheme-handler/http" = "zen-beta.desktop";
      "x-scheme-handler/https" = "zen-beta.desktop";
      "x-scheme-handler/about" = "zen-beta.desktop";
      "x-scheme-handler/unknown" = "zen-beta.desktop";
    };

  };
  xdg.desktopEntries.nvim = {
    name = "Neovim (Kitty)";
    genericName = "Text Editor";
    exec = "kitty -e nvim %F";
    terminal = false;
    mimeType = [ "text/plain" ];
    categories = [ "Utility" "TextEditor" ];
  };
}
