{

  imports = [
    ./bootloader.nix
    ./user.nix
    ./video.nix
    ./sound.nix
    ./input.nix
    ./env.nix
    ./gc.nix
    ./security.nix
    ./passwd.nix
    ./networking.nix
    ./font.nix
    ./stylix.nix
    ./services.nix

    ./packages.nix
  ];

  virtualisation.waydroid.enable = true;
}
