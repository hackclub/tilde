{ ... }:
{
  systemd.services.molly-brown.serviceConfig.SupplementaryGroups = [ "root" "users" ];
  services.molly-brown = {
    enable = true;
    certPath = "/srv/gmi/cert.crt";
    keyPath = "/srv/gmi/key.key";
    docBase = "/srv/gmi";
    hostName = "tilde.hackclub.com";
    settings = {
      homeDocBase = "pub";
    };
  };
}
