{ pkgs, ...}:
{
  security.acme = {
    acceptTerms = true;
    email = "swlittle7@gmail.com";
    server = "https://acme-staging-v02.api.letsencrypt.org/directory";
    certs = {
      "tilde.hackclub.com" = {
        webroot = "/srv/www";
      };
    };
  };
systemd.services."acme-tilde.hackclub.com".serviceConfig.ReadWritePaths = [ "/srv/www" "/var/lib/acme" ];
}
