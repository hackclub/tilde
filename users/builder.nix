{ pkgs, ... }:
{
   users.users."builder" = {
    description = "builder";
    isNormalUser = true;
    shell = pkgs.bashInteractive;
    openssh.authorizedKeys.keys = [
      " "
    ];
    extraGroups = [ "tty" ];
  };
}
