{ pkgs, ... }:
{
   users.users."caleb" = {
    description = "Caleb Denio";
    isNormalUser = true;
    shell = pkgs.bashInteractive;
    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQClVaaPuuYsEh4ecaXZL80WlsCSFhURnW32/1MAEtIw0KwE+vghe6dW80NCpAsvLbOTeJW9udekhQ5HbuAB6oCLc1BhvtKEg/RHcbHueyWA8Xg39FXMj2Y2YB79TBLYisNAerUaIc6VSeB3Mge/ViqGfrBC/ClGKyrIoJbpDEEO4DJhEFZV43GBhfovjZS1IUcD5p5unEi2aKQOmtrCXxeDYyVegQkQR+k9UFAZmRiHhEByaEVh0BMEzSsAzmrpGsja74TIZBJ6Xiq3rmcddN+AZ+bObVb6nxmPAcpK87y/5w+q/9u5jJg0kG78rpEwfEeCyM6wpGWI+B7x2OQT3MKE8P9f30KQRaskcfbc5shp1zcARmfT38sVWKZZhPS69s0ELRUTU0olI0EOtacjFlkUhUtxa5TOYwT86jlSTr9Sr5WgXwD88n7tmInSO+9itrK8E3u0A2Uy7YFe1/nmk8ofyWpSZfRVFTzWssZ/2XTyAujLBsVq2T5RkmDYJjXbMwE= cjdenio@Calebs-Laptop"
    ];
    extraGroups = [ "tty" ];
  };
}
