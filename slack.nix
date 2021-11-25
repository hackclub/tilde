{ pkgs, ...}:
{
  systemd.services.straembot = {
    enable = true;
    path = with pkgs.straembot; [ irc slack pkgs.nixFlakes ];
    serviceConfig.User = "straembot";
    script = ''
      source /run/secrets/tokens
      export SLACK_{APP,BOT}_TOKEN
      stream_irc | stream_slack
    '';
    wantedBy = [ "multi-user.target" ];
  };
}
