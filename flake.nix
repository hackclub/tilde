{
  description = "A very basic flake";

  inputs.about = {
    url = "git+https://git.sr.ht/~codelongandpros/about";
  };
  inputs.hcwiki = {
    url = "git+https://git.sr.ht/~codelongandpros/hcwiki";
  };
  outputs = { self, nixpkgs, about, hcwiki }:
    let
      system = "x86_64-linux";
      lib = nixpkgs.lib;
      pkgs = nixpkgs.legacyPackages.${system};
      overlays = [ (final: prev: { about = about.packages.${system}.about; hcwiki = hcwiki.packages.${system}.hcwiki;} ) ];
    in {
    nixosConfigurations = {
      hacktilde = lib.nixosSystem {
      inherit system;
      modules = [
        ./configuration.nix
        ({ pkgs, ...}: { nixpkgs.overlays = overlays; })
      ];
      };
    };
  };
}
