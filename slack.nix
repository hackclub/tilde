{ pkgs, ...}:
{
  systemd.services.straembot = {
    enable = true;
    path = [ pkgs.straembot pkgs.nixFlakes ];
    environment.NIX_PATH = "nixpkgs=/nix/var/nix/profiles/per-user/root/channels/nixos nixos-config=/etc/nixos/configuration.nix /nix/var/nix/profiles/per-user/root/channels";
    serviceConfig.User = "straembot";
    script = ''
      source /run/secrets/tokens
      export SLACK_{APP,BOT}_TOKEN
      stream_irc.py | stream_slack.py
    '';
    wantedBy = [ "multi-user.target" ];
  };
}
