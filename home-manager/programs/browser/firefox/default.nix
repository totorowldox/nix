{ pkgs, ... }: {
  programs.firefox = {
    enable = true;
    profiles = {
      remo = {
        id = 0;
        name = "remo";
        isDefault = true;
        settings = {
          "browser.search.defaultenginename" = "DuckDuckGo";
          "general.smoothScroll" = true;
        };
        extensions.force = true;
        extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
          immersive-translate
          raindropio
          onepassword-password-manager
          firefox-color
          scroll_anywhere
          tampermonkey
        ];
      };
    };
  };

  nixpkgs.config.permittedInsecurePackages = [ "immersive-translate-1.22.4" ];
}
