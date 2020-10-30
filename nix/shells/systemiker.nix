with import <nixpkgs> {};

stdenv.mkDerivation {
  name = "systemiker";

  buildInput = with pkgs; [
    nodejs-13_x
    heroku
  ];
}
