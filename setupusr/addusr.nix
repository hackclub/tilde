{ pkgs ? import <nixpkgs> {}, ...}:
with pkgs;
stdenv.mkDerivation {
  pname = "addusr";
  version = "0.0.2";
  src = ./addusr.py;
  buildInputs = [ python39 ];
  dontUnpack = true;
  dontBuild = true;
  installPhase = ''
    install -Dm755 $src $out/bin/addusr
  '';
}
