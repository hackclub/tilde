{ pkgs, ... }:
{
  systemd.services.nginx.serviceConfig.SupplementaryGroups = [ "users" ];
  security.acme = {
    acceptTerms = true;
    defaults = {
      credentialsFile = "/run/secrets/dnstokens";
      dnsProvider = "dnsimple";
      server = "https://acme-staging-v02.api.letsencrypt.org/directory";
      email = "jupiter@m.rdis.dev";
    };
  };
  services.nginx = {
    enable = true;
    recommendedTlsSettings = true;
    virtualHosts = {
      "tilde.hackclub.com" = {
        enableACME = true;
        acmeRoot = null;
        locations = {
	  "~ ^/.well-known/amce-challenge" = {
            alias = "/var/lib/amce/amce-challenge/";
	  };
          "/" = {
            root = "/srv/www";
          };
          "~ ^/~(.+?)(/.*)?$" = {
            alias = "/srv/pub/www/$1$2";
            extraConfig = ''
             autoindex on;
	     add_header Content-Security-Policy "default-src 'self' 'unsafe-eval' 'unsafe-inline'; sandbox allow-forms allow-orientation-lock allow-pointer-lock allow-presentation allow-scripts allow-same-origin";
            '';
          };
        };
      };
    };
  };
}
