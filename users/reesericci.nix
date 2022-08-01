{ pkgs, ... }:
{
   users.users."reesericci" = {
    description = "Reese";
    isNormalUser = true;
    shell = pkgs.bashInteractive;
    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDtJXJ1jH0J8/JseqadIYP2TkzqMQHTJWm7D7ycYnZP8IbYspyoCKheIkGkkW7pMSnK29KwvVWg4VN0vn+kGLbOu8fgoudGNkHgW8rt+/T7DdmjXWEoCOp4Sv8HIjANt/mbGLr8a7mF/fb/EvvOGuJHt0qb9dlrO227tXwLrs1isOqZiA55gFI56ua3gg0SIW7enJiNGx5AE8toeL9MZIA2cuSiCWoe1V8yidCk5bcXNZQdJtjtlHzXU9TfRGE3lwALsLZG7gbU6ww3t0YC9WcV9JsCCsj1vlMU3B5N6ElRVKkFNJS1BgGtN80VkWIgBQlEru6Vdjs7UaPHrO2lnvRpxC4hxMk5PmMP5iIqsiwwQabN93tqIuuiTG6VF7GTFcDxfwUv6s8JiDQEtif/Li5aKfoH0DoJRm2+drijFbZBFgU55DENLRvKynOG5lkmjcQ34D5ZHDpaZgMciK7IatojtIWzQRQ0RtTWwrY/RmN84Kx43s2bnko16+Bz4lpH2aU= reesericci@poptop"
    ];
    extraGroups = [ "tty" ];
  };
}
