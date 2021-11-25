{ pkgs, ...}:
{
  systemd.services.straembot = {
    enable = true;
    path = [ pkgs.straembot pkgs.nixFlakes ];
    environment.NIX_PATH = builtins.getEnv "NIX_PATH";
    serviceConfig.User = "straembot";
    script = ''
      source /run/secrets/tokens
      export SLACK_{APP,BOT}_TOKEN
      stream_irc.py | stream_slack.py
    '';
    wantedBy = [ "multi-user.target" ];
  };
}
