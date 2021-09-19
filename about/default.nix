{ pkgs ? import <nixpkgs> {}, ...}:
with pkgs;
stdenv.mkDerivation {
  pname = "about";
  version = "0.0.0";
  src = ./.;
  buildInputs = [ python39 ];
  dontBuild = true;
  installPhase = ''
    install -Dm755 $src/about.py $out/bin/about
  '';
}