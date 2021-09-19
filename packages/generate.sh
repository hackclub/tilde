#!/usr/bin/env bash
set -e
PKGS="$(find . -type f -name '*.pkgs' -exec cat {} +)"
echo "$PKGS"
echo "==="
ALLPKGS="$(uniq <<< "$PKGS" | sort)"
echo "$ALLPKGS"
cat > default.nix <<EOF
{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
${ALLPKGS}
  ];
}
EOF
