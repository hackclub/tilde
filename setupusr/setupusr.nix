{ pkgs ? import <nixpkgs> {}, ... }:
with pkgs;
stdenv.mkDerivation {
  pname = "setupusr";
  version = "0.0.1";
  src = ./setupusr.sh;
  buildInputs = [ (import ./addusr.nix {}) ];
  dontUnpack = true;
  dontBuild = true;
  installPhase = ''
    install -Dm755 $src $out/bin/setupusr.sh
  '';
}