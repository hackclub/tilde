{ ... }:
let
  addusr = (import ./addusr {inherit pkgs;});
  newusersetup = (import ./newusersetup {inherit pkgs;});
  rebuild = (import ./rebuild.nix {inherit pkgs;});
in
{
  envrionment.systemPackages = [
    addusr
    newusersetup
    rebuild
  ];
}
