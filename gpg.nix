{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    pinentry
    pinentry-curses
  ];
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
}

