{ pkgs, ... }:
pkgs.writeShellScriptBin "rebuild" ''
clear-src
nixos-rebuild switch --flake github:hackclub/tilde/main $@
''
