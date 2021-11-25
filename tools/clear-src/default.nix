{ pkgs, ... }:
with pkgs.stdenv;
writeShellApplication "clear-src" (builtins.readFile ./clear_src.nix) (with pkgs; [ jq nix ])
