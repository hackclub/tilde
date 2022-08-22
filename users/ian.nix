{ pkgs, ... }:
{
   users.users."ian" = {
    description = "Ian";
    isNormalUser = true;
    shell = pkgs.bashInteractive;
    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDnpCr7Et5J/W94JOTHwsHnylMaR73pL1NDWcac5h8ZrXcKfGSxXubJFEfVgI16xDmwUSkem3b+2HpB4xfdt/JyeZjX2gbc81N0GMh1js0ke3tC9p0H8LvKkbttvSdZaH9DQr92S5yb/pAIB/AyWsUuRkKOyzWIH8AQinvOde8ca3zsqbr4tcDY27gqDYm4MHyqqW8dLZS3nKWrIIz/YuAF8VPvU/6Clgl+x6gdz9MjqT2zQ7DRByZuD7j7/BoBb+mSR0kwgxna4erZWRT/BXNZM8R4ds3/kg83hLOg1X+g6xSd33VgiYwCWVsnWIpzKTFocNBDyFy4sO8vDuFxc6RfLdg18fhDb8tiNAjNiwnArGUxQqMD3Mfa+HoEnLRkviFuZAFcQYjj9r98HMvs3BvugG9XE6jxQ4t4GOONys+SlwEIrmwgdh51aPpNaC5WLL/jYo0C8bY8PCe7sQdA/OYwfP9w/PJ09QrvOUIcAhGBtWwZagr8dGUWYIWvskPQzek= yoda@mbp"
    ];
    extraGroups = [ "tty" ];
  };
}
