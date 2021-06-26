with import <nixpkgs> {};

stdenv.mkDerivation {
    name = "node12";
    buildInputs = [
      nodejs-12_x
      (yarn.override { nodejs = nodejs-12_x; })
    ];
}
