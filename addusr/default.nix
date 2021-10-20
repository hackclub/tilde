{ pkgs, ...}:
pkgs.writeShellScriptBin "addusr" "${builtins.readFile ./addusr.sh}"
