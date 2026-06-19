{
  imports = [ ./kitty.nix ./fastfetch.nix ];

  programs = {
    btop.enable = true;
    cava.enable = true;
    imv.enable = true;
    yazi.enable = true;
    yazi.shellWrapperName = "yy";
  };
}
