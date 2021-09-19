
{ pkgs, ... }:
{
users.users."me" = {
  description = "foo";
  isNormalUser = true;
  shell = pkgs.bashInteractive;
  openssh.authorizedKeys.keys = [ "bar" ];
};
}
