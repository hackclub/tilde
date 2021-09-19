#!/usr/bin/env python3
import sys
import os
if len(sys.argv) != 4:
    print(f"Usage: {sys.argv[0]} username real_name ssh_token")
    exit(1)
with open(f"users/{sys.argv[1]}.nix", "w") as f:
    contents = """
{ pkgs, ... }:
{
users.users."%s" = {
  description = "%s";
  isNormalUser = true;
  shell = pkgs.fish;
  openssh.authorizedKeys.keys = [ "%s" ];
};
}
""" % (sys.argv[1], sys.argv[2], sys.argv[3])
    f.write(contents)
with open("users/default.nix", "w") as f:
    files = [' ' * 4 + './' + file for file in os.listdir("users") if file != "default.nix"]
    contents = """
{ ... }:
{
  imports = [
%s
  ];
}
""" % ('\n'.join(files))
    f.write(contents)
