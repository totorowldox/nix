{config, inputs, pkgs, ...} : {
    programs = {
		btop.enable = true;
		cava.enable = true;
        imv.enable = true;
        yazi.enable = true;
    };
    
    /* Apps */
    home.packages = let gamePkgs=inputs.nix-gaming.packages.${pkgs.stdenv.hostPlatform.system}; in with pkgs;[
        #gamePkgs.osu-stable
        #osu-lazer-bin
    ];
}