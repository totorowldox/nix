{ inputs, pkgs, ... }: {
  home.packages = let
    gamePkgs = inputs.nix-gaming.packages.${pkgs.stdenv.hostPlatform.system};
  in with pkgs; [
    #gamePkgs.osu-stable
    osu-lazer-bin
    (prismlauncher.override {
      jdks = [
        temurin-bin-8 # For very old versions/mods
        temurin-bin-17 # For 1.20.1
      ];
    })
    temurin-bin-21
    umu-launcher
  ];
}
