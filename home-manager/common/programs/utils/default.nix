{ pkgs, ... }: {
  imports = [ ./ai.nix ];
  home.packages = with pkgs; [ qbittorrent-enhanced ];
}
