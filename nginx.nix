{ pkgs, ... }:
{
  systemd.services.nginx.serviceConfig.SupplementaryGroups = [ "users" ];
  services.nginx = {
    enable = true;
    virtualHosts = {
      "tilde.hackclub.com" = {
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
