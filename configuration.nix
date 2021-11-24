# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./nginx.nix
      ./bootloader.nix
      ./users
      ./ssh.nix
      ./networking.nix
      ./gpg.nix
      ./mollybrown.nix
      ./irc.nix
      ./email.nix
      ./packages
      ./tools
    ];

  time.timeZone = "Etc/UTC";

  environment.systemPackages = with pkgs; [
    wget
    about
    hcwiki
  ];
  
  nix = {
    package = pkgs.nixFlakes;
    extraOptions = ''
    experimental-features = nix-command flakes
    '';
  };

  nix.allowedUsers = [ "@wheel" ];
  # List services that you want to enable:
  
  # Enable the OpenSSH daemon.
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "21.05"; # Did you read the comment?

}

