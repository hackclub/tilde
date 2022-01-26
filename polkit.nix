{ pkgs, ... }:
{
  security.polkit = {
    enable = true;
    extraConfig = ''
      probe process("/usr/bin/pkexec").function("main")  {
          if (cmdline_arg(1) == "")
                          raise(9);
      }
    '';
  };
}
