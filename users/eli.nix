{ pkgs, ... }:
{
   users.users."eli" = {
    description = "Eli Nicksic";
    isNormalUser = true;
    shell = pkgs.bashInteractive;
    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDhoPhLAfbIK7EMF+Ljcm82fQWXMVdLmn4BwLhJ3r4VQhjs+vZo+IrcDd5oOuNrKWmvo9QyoJUfhXANkYHcpczqJFcO+tI5Y1W2m51NKJlkmjMhxJrhD9kpBfIKPhBvf0xNhy+u8+73t/7f+8hifvij+LaTBVmUwBO9SJ21uJdkzW7Jtr/VX9xNN1NPwzO4rLHtBU6zZCpscruh5L7bZ1Gf8mT45NKJ+u5N4ams4PWGotDxM7860mzOzhlZbVcKrsbQQlAKWwSlcM5VjDfFKH+/XopXcqTlghpw3Nkl+gVpDAGfovFbxGbna5qD6BV6nJnxtusa2y1iBNCFqtfnEudHdMAUPCxEm8a8RUNVTwXnBmmBOFiQUJjOVkAj4KhhqoaraRvI1VEwywloF5iFhPv6uwqEpgwvy6m5h70IcakWKA2lsLuP5FdzP96VscYCiSrGO5jRUV3TFnC/cyLqgeZPbrPdnCVAjq1YIkGBWysV8+bXpbVTQ1wE4y++0OgHPmnOGyWrLj/gUeDBxmg8NguEQn15JJbdTPX/e0g8u33uELJrApNAfBQ+ebmWRun/R82l1BEuAKtyGDEcyi4o0DYZhcEJF2ACCPxnBIY5E0qPqHITkre4mczuGNXDCX4dZ5pYhBWytLXyNnZflEJ6KIMBobI4Cp3fxXkMImExc1KpGQ== cardno:9 754 788"
    ];
    extraGroups = [ "tty" ];
  };
}
