{ pkgs, ... }:
{
   users.users."msw" = {
    description = "Max Speed";
    isNormalUser = true;
    shell = pkgs.bashInteractive;
    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDA3udweyI6SLS1DEuPaQGTphP50h3LuySAqY/Te6sUrTKVO9+DomCtO+5qPb5OvPVoSR3fylFjh7NGxAd5QGsz8lCOYFj/zrjGtAOGb/EX7J0NP4k7QqoAB9Fiu1ArOWyNBdIqVnXrWcyCpnaym/63ofxsk4+B0qEXM1WMy20ltgT244clectYZCmDaQcI0IY7hQ6Y4g3/z9yYcRPIcgiWFksF6XdcA/wknBWis8W0YBBIgi7D87HhJlGpQh3e5qQ5CKfiZbh5cdgUqetEm578x6hXZVQnSjS7YvgkNsOmf4JpkU3toUe6g3zB/BYvLw1NO5nj7FA+EfwSvIUdrTsBlJJGGcAL4BF1afW9ipQd7t/onxEeCRhu3yrTWfllOfbjfQ0Y3eg15YU76WD9kPX5f2syOlEBAvBBSrwKiDLwYkb/u0d0kcmd1sYlrDBCcpN+slQszzbTfZF9zvqkVp9jAxpdZIVRCrh9n8kLG/4WzTXmVYAIgK43ezE3MvVv2bgbYxd1XqgG+Jx68zKnRBTI/fkUd1fo/khxaPWvYSZpmen7oQt1bB80YseLVpBNTgUKdw3bmasnPR3OawCihtRwM3PfUkl5mCBtGXX+PQrHWKMUL/Dh9+vUgzaT0kXOYm8ujDQ3nnIITDAsqJGXrcVMFipz/0iNhTdoSW0F7AmZ5w=="
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCwOrGQHIOXS0QnCwYa3qZsmwJbozrgwA1ZuP08tmZZaaHfJj7oP1m42lYw3fSWzNlhXnw0yLAkAq0R3mbcTWRg9W7N7whpizPQfQGWzgZq/+C7cPgv5IaxeznEM2sD95OicaA7CCrVPXxaHzAxBo/sQtZsw/Ybo3/OmNcF8WWledXFrXNpAqwTXAvvq7WlGTyDPY9pLM+fBYZBS09YkmBwxVMYZdErb5INrSIGBGWVHfqMYVYtzVrgHQgCfpEKKDBEm3pHV4vVlbwTtDAmjc59YNcAXR/XUR3t2w8z3WKLFTLrltGhayGFhlbLTX4wHB/kMHwYxseqnHefgu5fMD3l6jNwQ8sOS76HjAYsOxD5XMUedVt3S6pKmCm8bChtC0z/yeY/0jl99Eptvc10HY8cffgIetOpFwjQrFoYHiFW3O3+yjlLcWD0zwfgKh0g6xc85dmLpds3SJlXCQ4r2wfGWvCM2fKuK9Rd2yrns/e6ZhkvAlmPq0HwGel7KVPC2uXae1v7bLdeqVBJSSTPludv4s07KLdBNhGztK9+OWexG5Wcf+EfeVJ3ig/yXNTACMG0loXJiBx3lJQwAmdW2PZFVJCMqbq7eOhEOudREjbpDY8ccNl6uPRL3bF2+EaZq5zjNJ9pqMTcV7HpbL38fcS8/ZnqlXaKH5e8JhgGpiZuOw=="
       "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAII5bJhhyjxGBe/3cU7NzbLBuX6hFn+nkgx3HD/nNDf4B"
       "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAzlZ5uUr6zBgwXj99x+PbVH08javMMgrgIltvArW5op"
       "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPrhhYe/ARsSJ1X7dpQwQcWcaokODCkp6I8FBz9R+PBl"
       "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAID/BUnY1AysGsBsjqQOyC4wKjlmar5yCLXy9pInYMtcc"
       "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIO+DriCt/V6DG2Jm8pGs9muW20DmPJA1GIrYqvrrgXN3"
    ];
    extraGroups = [ "tty" ];
  };
}
