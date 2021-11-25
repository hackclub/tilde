{ pkgs, ... }:
let
  addusr = (import ./addusr {inherit pkgs;});
  newusersetup = (import ./newusersetup {inherit pkgs;});
  rebuild = (import ./rebuild.nix {inherit pkgs;});
  clear_src = (import ./clear_src {inherit pkgs;});
in
{
  environment.systemPackages = [
    addusr
    newusersetup
    rebuild
    clear_src
  ];
}
