{ pkgs, ... }:
{
   users.users."param" = {
    description = "Param Siddharth";
    isNormalUser = true;
    shell = pkgs.bashInteractive;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICLPtp0iQrGAulhRvfNf77LkM//6BSLhZmryIZKRO6fh contact@paramsid.com"
    ];
    extraGroups = [ "tty" ];
  };
}
