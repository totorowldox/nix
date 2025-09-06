{pkgs, inputs, flakePath, ...} : {
    imports = [ inputs.niri.homeModules.niri ];
    home.packages = with pkgs; [
        (xwayland-satellite.override { withSystemd = false; }) # Niri automatically runs this when xwayland support is required
    ];
    programs.niri = {
        enable = true;
    };
}