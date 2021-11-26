
{ pkgs, ... }:
{
users.users."arc" = {
  description = "Arcade Wise";
  isNormalUser = true;
  shell = pkgs.bashInteractive;
  openssh.authorizedKeys.keys = [  
  "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDQNhyjjDaxYpv9mhgK0n8wvPBo1m+3Jak+hQuln6+uaLYaLhkka4v5BHQUU1IjUTXMDIJU3pWzjf2d/vLDAVKxm5YGq2YeFfqxv4iD3Lq8CzIyYQ9ak/P9MaaMXOtdPKO7HuG4VRtaV2h7YuX63Le5XD7BCbJTke1p353IaRlJMD0+aU8ZGbNai+ndaiPNNgWjYuHNIq+4sKw97mBSTCOEA2btJR9Dcha6sbkVPDGSlIG5oY8Kw1cCIUxaJ1XISUdHvY8Q3EH701d3/NhoPGAoiDTmzpT3dTtujFDoIcCsaSf/nJ0OQnoOSbLc4bK4Ii9Qtr7pKRBp3M4osHnbFzzP rsa-key-20211126" ];
};
}
