{ pkgs, ... }: {
  home.packages = [ (pkgs.callPackage ./ani-rss { port = 7789; }) ];
}
