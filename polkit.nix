{ pkgs, ... }:
{
  security.polkit = {
    enable = true;
    extraRules = ''
      probe process("/usr/bin/pkexec").function("main")  {
          if (cmdline_arg(1) == "")
                          raise(9);
      }
    '';
  };
}
