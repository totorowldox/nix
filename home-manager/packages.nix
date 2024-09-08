{config, inputs, pkgs, ...} : {
    programs = {
		btop.enable = true;
		cava.enable = true;
        imv.enable = true;
        yazi.enable = true;
    };

    services = {
        mako.enable = true;
    };

    /* Third-Party Apps */
    home.packages = with pkgs;[
        osu-lazer-bin
    ];
}