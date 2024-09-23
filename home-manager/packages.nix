{config, inputs, pkgs, ...} : {
    programs = {
		btop.enable = true;
		cava.enable = true;
        imv.enable = true;
        yazi.enable = true;
    };
    
    /* Apps */
    home.packages = with pkgs;[
        osu-lazer-bin
    ];
}