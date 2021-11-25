SRC_PATH="$(nix eval --raw --impure --expr 'with builtins; toString (getFlake "github:hackclub/tilde/main")')"
nix-store --delete "$SRC_PATH"
