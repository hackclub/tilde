{ pkgs, ... }:
{
   users.users."test" = {
    description = "TestMcTest";
    isNormalUser = true;
    shell = pkgs.bashInteractive;
    openssh.authorizedKeys.keys = [
      "eebydeebynotakey"
    ];
    extraGroups = [ "tty" ];
  };
}
