{ pkgs, ... }:
{
   users.users."fanoulis" = {
    description = "Charalampos Fanoulis";
    isNormalUser = true;
    shell = pkgs.bashInteractive;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIZQ1kT2A+DxiHlGssLekm+hkZYDfcff+dBB9ahlVtG7"
    ];
    extraGroups = [ "tty" ];
  };
}
