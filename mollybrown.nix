{ ... }:
{
  systemd.services.molly-brown.serviceConfig.SupplementaryGroups = [ "root" ];
  services.molly-brown = {
    enable = true;
    certPath = "/srv/gmi/cert.crt";
    keyPath = "/srv/gmi/key.key";
    docBase = "/srv/gmi";
    hostName = "localhost";
    settings = {
      homeDocBase = "/srv/pub/gmi";
    };
  };
}
