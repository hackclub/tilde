{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    irssi
  ];
  services.inspircd = {
    enable = true;
    config = ''
    <server
      name="localhost"
      description="Hack Club local IRC server"
      network="~Hack">
    <admin
      name="Madeline"
      nick="maddie"
      email="hack@club">
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
