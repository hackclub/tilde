{ pkgs, ... }:
pkgs.writeShellScriptBin "rebuild" ''
nix flake prefetch --no-write-lock-file github:hackclub/tilde/main
nixos-rebuild switch --flake github:hackclub/tilde/main $@
''
