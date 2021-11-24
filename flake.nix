{
  description = "A very basic flake";

  inputs.about = {
    url = "git+https://git.sr.ht/~codelongandpros/about";
  };
  inputs.hcwiki = {
    url = "git+https://git.sr.ht/~codelongandpros/hcwiki";
  };
  inputs.straembot = {
    url = "git+https://git.sr.ht/~codelongandpros/straembot";
  };
  inputs.sops-nix.url = github:Mic92/sops-nix;

  outputs = { self, nixpkgs, about, hcwiki, straembot, sops-nix}:
    let
      system = "x86_64-linux";
      lib = nixpkgs.lib;
      pkgs = nixpkgs.legacyPackages.${system};
      overlays = [ (final: prev: { about = about.packages.${system}.about; hcwiki = hcwiki.packages.${system}.hcwiki; straembot = straembot.packages.${system}.streambot;}) ];
    in {
    nixosConfigurations = {
      hacktilde = lib.nixosSystem {
      inherit system;
      modules = [
	sops-nix.nixosModules.sops
        ./configuration.nix
        ({ pkgs, ...}: { nixpkgs.overlays = overlays; })
	({ pkgs, ...}: { 
          sops.defaultSopsFile = ./.sops.yaml;
          sops.age.sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
	  sops.secrets.slack = { sopsFile = ./secrets/slack.nix; };
	})
      ];
      };
    };
  };
}
