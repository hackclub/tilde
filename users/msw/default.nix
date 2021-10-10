{ pkgs, ... }:
{
users.users."msw" = {
  description = "Max Wofford";
  isNormalUser = true;
  shell = pkgs.bashInteractive;
  extraGroups = [
    "wheel"
  ];
  openssh.authorizedKeys.keys = builtins.attrValues(import ./ssh-keys.nix);
};
}