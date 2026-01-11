{ pkgs, ... }: {
  home.packages = [
    (pkgs.callPackage ./ani-rss { port = 7789; })
    (pkgs.callPackage ./sakurafrp { })
  ];
}
