{ pkgs, ... }:
{
  users.users."msw" = {
    description = "Max Wofford";
    isNormalUser = true;
    shell = pkgs.bashInteractive;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAII5bJhhyjxGBe/3cU7NzbLBuX6hFn+nkgx3HD/nNDf4B max@rubber"
    ];
  };
}