
{ pkgs, ... }:
{
users.users."csalter" = {
  description = "Cara Salter";
  isNormalUser = true;
  shell = pkgs.bashInteractive;
  openssh.authorizedKeys.keys = [ "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC+odkBTQwTUG2VWIxa4jloKnfEIyCbVPHEAHni0ZhepYoLjGsHx5QYp5xg97kc+R9JVNmOHg056IVi+Pf5Ke+k+h1eu8Y3RsSL6uEGBw6OXT8m8qk7g27pxEl67J4m7B8xwXdJ4OvAO5M8cH16CXBppmIGmZ3lr2t0lcWKc4nxjCG0ziTEFr18CKoPNPKlpT3v8aWYIA3zb8ERB865CYi3knfDjhv6wBADx5U6xG8y2+aMK0hFsP8m4vA5NZA6M979UeRWfbo4EfYk9E/lxAeyWiLfkAFwG/eRuLTROPrhPnCQFeGSf1Tm/n4AxiVlWjd6f4WqiZbrqSBMPXwRkqTr" ];
};
}
