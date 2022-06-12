{ pkgs, ... }:
{
   users.users."tej" = {
    description = "Tejas Agarwal";
    isNormalUser = true;
    shell = pkgs.bashInteractive;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIhOZuiY1Tj/JYdXQ5qL2s6C+picXlKRONfKgjesV/tZ tejasagarwalbly@gmail.com"
    ];
    extraGroups = [ "tty" ];
  };
}
