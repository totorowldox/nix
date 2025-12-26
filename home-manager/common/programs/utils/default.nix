{ pkgs, ... }: {
  imports = [ ./ai.nix ./vicinae.nix ];
  home.packages = with pkgs; [ qbittorrent-enhanced ];
}
