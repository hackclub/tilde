{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
aerc
amfora
bashInteractive
deno
emacs
fish
gitFull
gnumake
go
mercurial
micro
mutt
nano
neomutt
neovim
ripgrep
screen
ssmtp
starship
tmux
vim
zellij
zsh
  ];
}
