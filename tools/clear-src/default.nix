{ pkgs, ... }:
with pkgs.stdenv;
mkDerivation {
  pname = "clear_src";
  version = "0.0";
  buildInputs = with pkgs; [ jq nix ];
  src = ./.;
  dontBuild = true;
  installPhase = ''
  install -Dm755 $src/clear_src.sh $out/clear-src
  '';
}
