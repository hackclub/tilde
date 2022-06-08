
{ pkgs, ... }:
{
users.users."csalter" = {
  description = "Cara Salter";
  isNormalUser = true;
  shell = pkgs.bashInteractive;
  openssh.authorizedKeys.keys = [ "ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBI9iJCAUt5NfYmVanD7URVUblGUOwgs7NVG0rWlBvVEdbah/il8IU8QKs3z3XDHgKktyC9XYw8clX8IWZzUFxIg= csalter@cesium" ];
};
}
