
{ pkgs, ... }:
{
users.users."arc" = {
  description = "Arcade Wise";
  isNormalUser = true;
  shell = pkgs.bashInteractive;
  openssh.authorizedKeys.keys = [  
  "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDQNhyjjDaxYpv9mhgK0n8wvPBo1m+3Jak+hQuln6+uaLYaLhkka4v5BHQUU1IjUTXMDIJU3pWzjf2d/vLDAVKxm5YGq2YeFfqxv4iD3Lq8CzIyYQ9ak/P9MaaMXOtdPKO7HuG4VRtaV2h7YuX63Le5XD7BCbJTke1p353IaRlJMD0+aU8ZGbNai+ndaiPNNgWjYuHNIq+4sKw97mBSTCOEA2btJR9Dcha6sbkVPDGSlIG5oY8Kw1cCIUxaJ1XISUdHvY8Q3EH701d3/NhoPGAoiDTmzpT3dTtujFDoIcCsaSf/nJ0OQnoOSbLc4bK4Ii9Qtr7pKRBp3M4osHnbFzzP rsa-key-20211126"
  "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDQqkzwyx0dM3F92YdxdBS5w7KFoLgRk0WxQfoN+JgRVRwLn89Y2CpcwP1YLEoPzJHko4VbOPGQxoAAQrjI774bG+Auc+T+w3ZEvughnkOqn4tbnq28V8tzVjuNodIoTnrw2BgqTkCNCoOd24QVPSU2u1zryuBftU/GYX2tNbds1p4rKwt/gEe/UFVQVjul4E/DaiLRiR8e+EXwN+6zQJfJS5C7b8sKs5oNih4t8Yn/08h1aeBG/7eYpLuDiMSwTILMY6B/czv1bnmFYUbJtjKjBfacn67NbIkLOYb4dAPuQsjT1QKnHacaPEhYhjkjAtSnnIClzlS29XqKzDKrOzkm9Xnfwfbn9M/1g+kZwt7HTg5VowJadGAz27JMcs05lOsQDglEeQhXtHDOOU0nKPcKMuvV08inaUNh2vfFM+caZ/KjJpKbfdiSaEvGZrZ7WUKfBdr/ZcCuL9DHGeMRDliAySOPFkEzVQsKrS2cd71R9dMH0TxSb9ZzU9rS7qSk0Uk= arc@alphaCentauri"
  ];
};
}
