{ pkgs, ... }:
{
   users.users."cheru" = {
    description = "Cheru";
    isNormalUser = true;
    shell = pkgs.bashInteractive;
    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCrqQksu0Y84BeUvewwENm6M7VXlxrN0HNId9who7Xem/xKPEHJw2BDVwxHyFK2CMp0AHPOaAcfECkhEkgLo7PSejDBoQA15/JV0g2pSIVX0Z5D1VYyYBlrQRi67P7vvwNcAkIdVfs62CMV2uo+CbV8Qg/ikZ9DB9+CszcbIL2SYH8T6jbzpnR2rh2gYyGLihOHeTihLwhQT+2wDTUgN6DSMwNpFxrzH3h+ctjMDqwqfywGjifC8oFRItAncKJFqsm8+8tcI0z4KTidZWpvmC2NNGSehs9y/qQLc7qBUSB6XBzyybOiEsqgBSUZWOsA0NXe4qINGI9tlLFe57cE3dsS9Bi/mGz3jpEpjB3wffwOp/fYxbbZnGqtAj41ysjSo60t2cfLO47v5XUGkNLXq5erJQdQ3XPTbFSLZU+DgOvnlqjWorRKTgYZagpYOB2OUoWO8Z7Jv5e/K2F+FpDX/0UcZm3TLsJUUUWhOQIaVQCchfSS0yIBgiT6JHHJUbpvatk= cheru@cheru-laptop"
    ];
    extraGroups = [ "tty" ];
  };
}
