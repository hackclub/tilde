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
  security.sudo.extraRules = [
    {
      users = [ "builder" ];
      commands = [ { command = "/run/current-system/sw/bin/rebuild"; options = [ "NOPASSWD" ]; } ];
    }
  ];
}
