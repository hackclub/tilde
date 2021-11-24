{ pkgs, ... }:
{
   users.users."anirudh" = {
    description = "anirudh";
    isNormalUser = true;
    shell = pkgs.zsh;
    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCoNue+dEehX3uBhVEaNKlB3i1kk1OSsegWWVEh4igk3CijsLjV9DieqlCq+ZQ0IBloFrwEBJzZAtQmhzX2rBcEkW74Z2Mjld7XoIOmiv+TbtdfmBSifvu+pwTilYbQUlAxqiDOiv1MRRY5lgSBfpyk0UjN9ZTeYXFNqsA0nRuLdobTrIBQK5JN+WBUylCGYkRKyI/QB5bE0/Wu4PYKLgjit9uRX35rXeHVMMd+J347bIgCpu7OJAyDWcET8bXonMlNLqCg/4mX1Iy9ukzsVTglVh8zt7xjuaW7PG4cK9ERW9ytVvwaoF/sOJX+p9s8Vm097EcMRRBRGZsea19TYNIJjdtiIGiAw23Re8M/IwkhgqySVokc17jcRoqAzxiN2kUr1SzGIxgV4mYX0uSuEmWJ6OklpKY7bGRbkN34T3915dWPMyIwpQPAW9xeS1oL9c1a04uQpY61DmrAhXvApcQxZs6TYbpyBkjVR+xqZs7obWdD1AIRPTskFRO7lP7FZsjF/FHiPslqqHGQomdlnArYhDYT2mMVqnnq8pa8EwYFYe+JS+PtFw+J9QL8BTIXP+3LZTdeflYICBdDdfxGAk1eAsX3wzhWi0B2cZNwgPhTDWIfgaY84sw0a6idLKiZSgN3vBmSB2qIaemlyuXS4/mX2VosTAKxMhgTM2UrwbaeyQ=="
    ];
    extraGroups = [ "tty" ];
  };
}
