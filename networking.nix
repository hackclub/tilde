{ ... }:
# Various networking settings
{
  networking = {
    hostName = "hacktilde";
    useDHCP = false;
    defaultGateway.address = "10.101.8.1";
    interfaces.ens18.useDHCP = false;
    interfaces.ens18.ipv4.addresses = [ { address = "10.101.13.164"; prefixLength = 16; } ];
    nameservers = [ "1.1.1.1" ];
    firewall.allowedTCPPorts = [ 22 80 443 1965 ];
  };
}
