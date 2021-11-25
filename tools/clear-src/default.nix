{ pkgs, ... }:
with pkgs.stdenv;
pkgs.writeShellApplication {
  name = "clear-src";
  text = builtins.readFile ./clear_src.sh;
  runtimeInputs = with pkgs; [ jq nix ];
}
