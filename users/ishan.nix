{ pkgs, ... }:
{
   users.users."ishan" = {
    description = "Ishan Goel";
    isNormalUser = true;
    shell = pkgs.bashInteractive;
    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDE0as45AV2k03QvyFT2jZdXDAYf9AfoHKQdVRnP+3hGsvGNwfcxHLAjl3bwEl96wKY3t+Hu6VOF8Y+W0Wpi4H7i78Jwit4gEXPePaKCImNwwXHQAUyBkTbSm/W/7tMkiKvq5A6K0pZeTnDeF9auaJMqIRqg+cvizNBesngYqoWQr5zy0bz+i8qzN3F6TyZLRegq0ujS+qKWcOBNoYPmTCmhtDwcPKXzaG+1Oodu9Ubftk7KkIOn7l4kf6yf4H7Osg7QQjownts+u/hylU+ctkck3pgc50UU6SeVwXQO+I2eMK575jXOIiIqLEBBFY2J3PdLClnNDwsJ8QC2sqFD3DdNQ40aFn+t37zxfpW9ZaPPrRHRIGb8hS/eKPa3x5/tHzonzH/lAFA25D32UDhmW8sHIa3PhyhbTjcHjM0j5yoab7+p4CBGpG0NNKTZO7fnAIXnCTGjPRhleV2xSDyXfKEadhagdfQPZeT+WUND4lo138MWa5zXgsaZ9ZpKh483YU= ishan@mac"
    ];
    extraGroups = [ "tty" ];
  };
}
