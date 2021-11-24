
{ pkgs, ... }:
{
users.users."straembot" = {
  uid=69;
  description = "mirror irc";
  isSystemUser = true;
  group = "keys";
  shell = pkgs.bashInteractive;
};
}
