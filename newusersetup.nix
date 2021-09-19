{ pkgs ? import <nixpkgs> {}, ...}:
pkgs.writeShellScriptBin "newusersetup" (builtins.readFile ./newusersetup.sh)
