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
    };
  };
}
