{ inputs, pkgs, ... }: {
  home.packages = let
    gamePkgs = inputs.nix-gaming.packages.${pkgs.stdenv.hostPlatform.system};
  in with pkgs;
  [
    #gamePkgs.osu-stable
    osu-lazer-bin
  ];
}
