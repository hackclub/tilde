{ ... }:
{
    users.motd = builtins.readfile ./motd.txt;
}