{
  description = "A very basic flake";

  inputs.about = {
    url = "git+https://git.sr.ht/~codelongandpros/about";
  };
  outputs = { self, nixpkgs, about }:
    let
      system = "x86_64-linux";
      lib = nixpkgs.lib;
      pkgs = nixpkgs.legacyPackages.${system};
      overlays = [ (final: prev: { about = about.packages.${system}.about; }) ];
    in {
    nixosConfigurations = {
      tilde = lib.nixosSystem {
      inherit system;
      modules = [
        ./configuration.nix
        ({ pkgs, ...}: { nixpkgs.overlays = overlays; })
      ];
      };
    };
  };
}
