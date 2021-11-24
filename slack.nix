{ pkgs, ...}:
{
  system.services.straembot = {
    enable = true;
    path = [ pkgs.straembot ];
    source = ''
      source /run/secrets/tokens
      export SLACK_{APP,BOT}_TOKEN
      stream_irc.py &
      stream_slack.py &
    '';
    requireds = [ "network-online.target" ];
    wantedBy = [ "multi-user.target" ];
  };
}
