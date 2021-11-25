{ pkgs, ... }:
with pkgs.stdenv;
pkgs.writeShellApplication "clear-src" (builtins.readFile ./clear_src.nix) (with pkgs; [ jq nix ])
