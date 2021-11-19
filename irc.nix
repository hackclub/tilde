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
      password="$5$rRMFfZKtyeG$R7Bjyxkx52B88tiUO/mlo.SoMwjKRkjnNJLwwnOG.kD"
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
