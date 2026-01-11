{ pkgs ? import <nixpkgs> { } }:

pkgs.stdenv.mkDerivation rec {
  pname = "Sakura FRP";
  version = "3.1.7";

  src = pkgs.fetchurl {
    url =
      "https://nya.globalslb.net/natfrp/client/launcher-unix/${version}/natfrp-service_linux_amd64.tar.zst";
    sha256 = "14d242pg4p0ar1h857r2vp27fa3lmssa2rsb5szvia2frs2v22lq";
  };

  nativeBuildInputs = [ pkgs.zstd ];

  unpackPhase = ''
    mkdir -p $out/bin
    zstd -d < $src | tar xf - -C $out/bin
  '';

  installPhase = ''
    chmod +x $out/bin/frpc
    chmod +x $out/bin/natfrp-service
  '';

  meta = with pkgs.lib; {
    description = "Sakura FRP";
    platforms = platforms.linux;
  };
}
