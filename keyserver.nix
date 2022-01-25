{ config, pkgs, ... }: {
  services.pgpkeyserver-lite = {
    enable = true;
    hkpAddress = "keys.hackclub.com";
  };
}
