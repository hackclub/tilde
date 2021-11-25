{ pkgs, ... }:
with pkgs.stdenv;
pkgs.writeShellApplication {
  name = "clear-src";
  text = builtins.readFile ./clear_src.nix;
  runtimeInputs = with pkgs; [ jq nix ];
}
