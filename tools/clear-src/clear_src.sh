REV="$(nixos-version --json | jq .configurationRevision)"
SRC_PATH=$(nix-instantiate --eval --expr \
	"(builtins.fetchGit { url = \"https://github.com/hackclub/tilde\"; ref=\"main\"; rev=$REV;}).outPath" \
	| tr -d \")
nix-store --delete "$SRC_PATH"
