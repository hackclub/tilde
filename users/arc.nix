
{ pkgs, ... }:
{
users.users."arc" = {
  description = "Arcade Wise";
  isNormalUser = true;
  shell = pkgs.bashInteractive;
  openssh.authorizedKeys.keys = [ "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDNW1Db7HZy2cD2KN4R7psIRtFrQEdFIpMhZU5Xfw0hjm1rNf7l4tl7kmxSHTvwwayHda8ybQDDlkTd4z1OQUvCCARYjLIyN32PPp4wER4VUPb7FfdTFh/mhUb53k3lcojcb3BmY21Z98kQqNSkIDtQ1jsKVf0Hq10aertpdMEc3Mp/fnq+IsGpHdE0PD44ARp79dijz55Ym8FrVe/duO++HreYcV1oI2e4fyte2N5iBsM3KWrDdVLiTOGyjMSyfEA7BV4W4aDMweUwVZWw4PeHMzJGWwwLON7BuoCG5fNesp/vjnmH9hIQNFkquSSf6GaekBammr3kPzcghFM32F25U2kNdrQKG9CKIskoWKr3KTukEBurK6WFLwdPqRoj8hRpar5WbRmVhwyWvyqt8uqwLdU4FcKJCO85FgjAKVlo8g5KWEpkBCWOUcVzTdX8OYETHOyeHUCVPbNOMW8WL4f1pFaLdhAs8ru2M1W44wYvA6vP190zEknvePx3cOPFFZc= arc@nixGalaxy" ];
};
}
