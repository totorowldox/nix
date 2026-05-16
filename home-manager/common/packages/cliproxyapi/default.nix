{ pkgs ? import <nixpkgs> { } }:

pkgs.stdenv.mkDerivation rec {
  pname = "cliproxyapi";
  version = "7.0.9";

  src = pkgs.fetchurl {
    url =
      "https://github.com/router-for-me/CLIProxyAPI/releases/download/v${version}/CLIProxyAPI_${version}_linux_amd64.tar.gz";
    sha256 = "02s26sih2d5lwyac147cdc5jcc3z7vpy2zz9wpl72py9bv0lpazf";
  };

  sourceRoot = ".";

  installPhase = ''
    mkdir -p $out/bin
    cp cli-proxy-api $out/bin/
  '';

  meta = with pkgs.lib; {
    description =
      "Wrap Gemini CLI, Antigravity, ChatGPT Codex, Claude Code as an OpenAI compatible API service";
    homepage = "https://github.com/router-for-me/CLIProxyAPI";
    license = licenses.mit;
  };
}
