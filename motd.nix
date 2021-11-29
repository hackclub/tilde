{ ... }:
{
    users.motd = builtins.readFile ./motd.txt;
}
