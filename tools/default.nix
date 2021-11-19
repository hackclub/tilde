{ pkgs, ... }:
let
  addusr = (import ./addusr {inherit pkgs;});
  newusersetup = (import ./newusersetup {inherit pkgs;});
  rebuild = (import ./rebuild.nix {inherit pkgs;});
in
{
  environment.systemPackages = [
    addusr
    newusersetup
    rebuild
  ];
}
