{ pkgs, ... }:
{
   users.users."zfogg" = {
    description = "Zachary Fogg";
    isNormalUser = true;
    shell = pkgs.bashInteractive;
    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDJHEnZyT4dMUf2p4kW1THB/EuTQ+AGiAEUA2JlMv7VafuZzpHpp0ShCgC7JRS9ixrW03UHoNAmZAXSMygDMpagm2HEQbYyzRSqj5t9lqNsl5bqHDA6Y5P4HNjJXtTFx2LJHwLAZUk5YZLWGKOjbgQkII3tAqcFM8003jDFDkmVcdiy6WJ5RQptE+tdiGRJYEFjG4BwnUpMFG+jsv88Q8ZgPbF5kfpyqvmmtGYTaqop/g0OTECGhnwJkPs27VlZhIxUiNauLAlSaGky710hbzedaug/P/n+OLeREO1tnPcJXIBpfy7+3dE+gc67XEohk7vVLJNa/tqQsm9Vqo4Xgv2h"
    ];
    extraGroups = [ "tty" ];
  };
}
