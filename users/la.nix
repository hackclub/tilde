{ pkgs, ... }:
{
   users.users."la" = {
    description = "Laker";
    isNormalUser = true;
    shell = pkgs.bashInteractive;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIM1eDPAc/Ue0mSnxYkERSMV82LkJytWkmJqqxGYTE9th"
    ];
    extraGroups = [ "tty" ];
  };
}
