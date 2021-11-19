{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    irssi
  ];
  services.inspircd = {
    enable = true;
    config = ''
    <module name="operjoin">
    <module name="botmode">
    <module name="chanhistory">
    <module name="password_hash">
    <module name="sha256">
    <module name="pbkdf2">
    
    <mkpasswd operonly="yes">
    <chanhistory bots="no"
             enableumode="yes"
             maxlines="50"
             prefixmsg="yes">
    <server
      name="tilde.hackclub.com"
      description="Hack Club local IRC server"
      network="~Hack">
    <admin
      name="Mirabelle"
      nick="mirabelle">
    <class name="root" commands="*">
    <type name="NetAdmin"
    classes="root"
    class="ServerOperators">
     <oper
      name="mirabelle"
      password="12288:lkLdMHrb08mjZoAbhvNDSDk7IOP5d6+driL6Ej+SfjI:s346x/ttkdkMjs22aw5FUwV7WisWrSt1hbhwViGBXdU"
      hash="sha256"
      host="*"
      type="NetAdmin"
      autojoin="#lobby,#announcements"
    >
    <bind
      address="0.0.0.0"
      port="6697"
      type="clients">
    <connect
      name="main"
      allow="*"
      maxchans="1">
 '';
  };
}
