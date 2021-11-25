{ pkgs, ... }:
with pkgs.stdenv;
mkDerivation {
  pname = "clear_src";
  version = "0.0";
  buildInputs = with pkgs; [ jq nix  ];
  src = ./.;
  buildPhase = ''
  install -Dm755 $src/clear_src $out/clear-source
  '';
}
