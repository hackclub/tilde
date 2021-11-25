{ pkgs, ...}:
{
  systemd.services.straembot = {
    enable = true;
    path = [ pkgs.straembot ];
    serviceConfig.User = "straembot";
    script = ''
      source /run/secrets/tokens
      export SLACK_{APP,BOT}_TOKEN
      stream_irc.py &
      stream_slack.py &
    '';
    wantedBy = [ "multi-user.target" ];
  };
}
