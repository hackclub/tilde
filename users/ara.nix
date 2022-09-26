{ pkgs, ... }:
{
   users.users."ara" = {
    description = "Ara Narula";
    isNormalUser = true;
    shell = pkgs.bashInteractive;
    openssh.authorizedKeys.keys = [
      "AAAAB3NzaC1yc2EAAAADAQABAAABgQDAx9Umcf8SUzYzBErt+6J98ZLDq5negLHwwGhmsTNICG8CpHj0awAekgEKua+kcNtXC/2swyknp3U6HMmwiblAHYQjnBrkzMvRHDKo0UEH4WR+EOuX7RJCg4qh28/uI2wmDNLkhEsJaYbXoyZhCAJSdPu9h+SGO8FXw5n11WhYBbUfn0wQTMxve4rR1yysPVOWOSeLyEeIkefFpP5Yp7qmurdVFE3bqoGvjXJsvDvTKnBt3cJGYVzSdwCYEmEP33Kh63knIDxUJaFElF8tKDAyIAJI4ExfA0zU+hWFKHAm/dRklQF0O9KDCYjkzMjHW9PEbUyzJWOiW0Or9WVgKwyE5j7ICDC3FuGVgJGC7TqfvrU7BQo/jIRaAnUcCtoQwUWLDDa/mFk7gxuAwoTWQZLspfzBGWZjLgV8MaX+rpMO+WJuURfo0PP9Rqkw1b7Yoi6QP924g2J5CQN47B7/DFmaIrarGtW8yARG9AA/Ny61TVjoKzRn4sI8W/G+iRzO4TM= arav1@BAabyyoda"
    ];
    extraGroups = [ "tty" ];
  };
}
