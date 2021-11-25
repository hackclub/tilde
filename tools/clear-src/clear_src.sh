REV="$(nixos-version --json | jq .configurationRevision)"
PATH=$(nix-instantiate --eval --expr \
	"(builtins.fetchGit { url = \"https://github.com/hackclub/tilde\"; ref=\"main\"; rev=$REV;}).outPath" \
	| tr -d \")
echo $PATH
echo $(which nix-store)
nix-store --delete $PATH
