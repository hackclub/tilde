{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    irssi
  ];
  services.inspircd = {
    enable = true;
    config = ''
    <module name="operjoin">
    <server
      name="tilde.hackclub.com"
      description="Hack Club local IRC server"
      network="~Hack">
    <admin
      name="Mirabelle"
      nick="mirabelle"
     >
     <oper
      name="mirabelle"
      password="$5$J0mx6gbzgl$Ta/v8xo4y.6WTyQM9y9tGykLen7EoUF2AnSmcEmlMK0"
      hash="sha256"
      host="*"
      type="NetAdmin"
      autojoin="#lobby,#announcement"
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
