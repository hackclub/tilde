{ pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    aerc
    mailutils
    neomutt
    mutt
  ];
  services.postfix = {
    enable = true;
    config = {
      myhostname = "mail.tilde";
      mydomain = "hackclub.com";
      mynetworks = "127.0.0.1";
      home_mailbox = "mail/";
      mailbox_command = "";
    };
  };
}
