with import <nixpkgs> {};

stdenv.mkDerivation {
  name = "node13";

  buildInputs = with pkgs; [
    nodejs-13_x
    (yarn.override { nodejs = nodejs-13_x; })
  ];
}
