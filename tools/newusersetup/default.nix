{ pkgs ? import <nixpkgs> {}, ...}:
#pkgs.writeShellScriptBin "newusersetup" (builtins.readFile ./newusersetup.sh)
with pkgs;
stdenv.mkDerivation {
	pname = "newusersetup";
	version = "0.0.2";
	src = ./newusersetup.sh;
	dontUnpack = true;
	dontBuild = true;
	installPhase = ''
	install -Dm755 $src $out/bin/newusersetup
	'';
}
