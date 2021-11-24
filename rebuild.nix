{ pkgs, ... }:
pkgs.writeShellScriptBin "rebuild" ''
nix-collect-garbage
nixos-rebuild switch --flake github:hackclub/tilde/main $@
''
