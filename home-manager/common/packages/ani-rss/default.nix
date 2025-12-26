{ pkgs ? import <nixpkgs> { }, port ? null }:
pkgs.stdenv.mkDerivation rec {
  pname = "ani-rss";
  version = "2.2.12"; # Match the release version

  src = pkgs.fetchurl {
    url =
      "https://github.com/wushuo894/ani-rss/releases/download/v${version}/ani-rss-jar-with-dependencies.jar";
    sha256 = "1c7pcqpaszwx1rc4kcq7b1kjyn0q2g527nga4b22lnafwc3v28vk";
  };

  dontUnpack = true; # No need to extract, it's a single JAR

  nativeBuildInputs = [ pkgs.makeWrapper ];

  installPhase = let
    # Build the flags string conditionally based on provided options
    javaFlags = pkgs.lib.concatStringsSep " "
      ([ "-jar $out/share/java/${pname}-${version}.jar" ]);
  in ''
    mkdir -p $out/share/java $out/bin
    cp $src $out/share/java/${pname}-${version}.jar
    makeWrapper ${pkgs.jre}/bin/java $out/bin/${pname} \
      --add-flags "${javaFlags}" \
      --prefix PATH : ${pkgs.jre}/bin
  '';

  meta = with pkgs.lib; {
    description = "ANI-RSS for Nix";
    license = licenses.gpl2Only; # Adjust as needed
    platforms = platforms.all;
  };
}
