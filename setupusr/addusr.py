#!/Usr/bin/env python3
import sys
import os
import pwd
from pathlib import Path

if len(sys.argv) != 4:
    print(f"Usage: {sys.argv[0]} username real_name ssh_token")
    exit(1)
os.chdir(Path.home() + "/nixos")
with open(f"users/{sys.argv[1]}.nix", "w") as f:
    print(f"info: creating /etc/nixos/users/{sys.argv[1]}.nix")
    contents = """
{ pkgs, ... }:
{
users.users."%s" = {
  description = "%s";
  isNormalUser = true;
  shell = pkgs.bashInteractive;
  openssh.authorizedKeys.keys = [ "%s" ];
};
}
""" % (sys.argv[1], sys.argv[2], sys.argv[3])
    f.write(contents)
with open("users/default.nix", "w") as f:
    files = [os.path.abspath(os.path.join("users", file)) for file in os.listdir("users") if file != "default.nix"]
    files = [file for file in files if not file.endswith("/.nix") or not file.endswith("~")]
    print("info: creating /etc/nixos/default.nix with these users:")
    print(files)
    contents = """
{ ... }:
{
  imports = [
%s
  ];
}
""" % ('\n'.join(files))
    f.write(contents)

print("info: commiting")
os.system(f"git add users/{sys.argv[1]}.nix")
os.system(f"git commit -m \"add {sys.argv[1]}\"")
os.system("git push origin main"
print("info: rebuilding NixOS")
os.system("nixos-rebuild switch --flake github:hackclub/tilde/main")

print("info: setting up hosting under /srv/pub/{sys.argv[1]}")
pub_path = f"/srv/pub/{sys.argv[1]}"
if not os.path.exists(pub_path):
    os.mkdir(pub_path)
    
for srv in ("www", "gmi"):
    path = os.path.join(pub_path, srv)
    if not os.path.exists(path):
        os.mkdir(path)
bash_rc = os.path.join("/home", sys.argv[1], ".bash_profile")
with open(bash_rc, "a") as bashrc:
    bashrc.write("exec newusersetup")
userinfo = pwd.getpwnam(sys.argv[1])
os.chown(bash_rc, userinfo[2], userinfo[3])
os.chown(pub_path, userinfo[2], userinfo[3])
os.chmod(pub_path, 0o644)
