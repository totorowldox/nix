{ pkgs ? import <nixpkgs> { } }:

pkgs.stdenv.mkDerivation rec {
  pname = "sjmcl";
  version = "1.1.3";

  src = pkgs.fetchurl {
    url =
      "https://github.com/UNIkeEN/SJMCL/releases/download/v${version}/SJMCL_${version}_linux_x86_64.deb";
    hash = "sha256-hYzb5rxN49NZfUCpnublQChn9eekfeYsdE5LreeZULg=";
  };

  nativeBuildInputs = with pkgs; [
    dpkg
    autoPatchelfHook
    wrapGAppsHook4
    makeWrapper
  ];

  buildInputs = with pkgs; [
    glib # Provides libglib-2.0, libgobject-2.0, libgio-2.0
    dbus # Provides libdbus-1
    gtk3 # Provides libgtk-3, libgdk-3
    webkitgtk_4_1 # Provides libwebkit2gtk-4.1, libjavascriptcoregtk-4.1
    libsoup_3 # Provides libsoup-3.0
    fontconfig # Provides libfontconfig
    gdk-pixbuf # Provides libgdk_pixbuf-2.0
    cairo # Provides libcairo
    stdenv.cc.cc.lib # Provides libgcc_s
  ];

  unpackPhase = "dpkg-deb -x $src unpack";

  installPhase = ''
    mkdir -p $out
    cp -r unpack/usr/* $out/

    # makeWrapper 在它外面套一层壳
    wrapProgram $out/bin/SJMCL \
      --prefix LD_LIBRARY_PATH : "${
        pkgs.lib.makeLibraryPath [
          pkgs.glfw
          pkgs.mesa
          pkgs.libglvnd
          pkgs.xorg.libX11
          pkgs.xorg.libXcursor
          pkgs.xorg.libXrandr
          pkgs.xorg.libXi
          pkgs.xorg.libXext
          pkgs.xorg.libXxf86vm
          pkgs.stdenv.cc.cc.lib
          pkgs.alsa-lib
          pkgs.libpulseaudio
        ]
      }:/run/opengl-driver/lib" # 这一行非常重要！它直接指向 NixOS 系统的当前显卡驱动目录
  '';
}
