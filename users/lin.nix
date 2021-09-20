
{ pkgs, ... }:
{
users.users."lin" = {
  description = "sexy catgirl meow";
  isNormalUser = true;
  shell = pkgs.bashInteractive;
  openssh.authorizedKeys.keys = [ "" ];
};
}
