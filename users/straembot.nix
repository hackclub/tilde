
{ pkgs, ... }:
{
users.users."straembot" = {
  description = "mirror irc";
  isSystemUser = true;
  group = "keys";
  shell = pkgs.bashInteractive;
};
}
