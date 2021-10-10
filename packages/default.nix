{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
aerc
ameba
amfora
bashInteractive
crystal
crystal2nix
deno
emacs
fish
gcc
gcc
gitFull
go
mercurial
micro
mutt
nano
neomutt
neovim
python39
ripgrep
rustup
screen
ssmtp
starship
tmux
vim
zellij
zsh
  ];
}
