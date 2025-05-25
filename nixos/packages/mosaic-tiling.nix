{pkgs, ... } : with pkgs; stdenv.mkDerivation rec {
    pname = "mosaic-tiling";
    version = "0.1.0";
    src = fetchgit {
        url = "https://github.com/DEM0NAssissan7/mosaic";
        sha256 = "";
    };
    buildInputs = [];
    configurePhase = "";
    buildPhase = ''
        sh ./install.sh
    '';
    installPhase = ''
    '';
}