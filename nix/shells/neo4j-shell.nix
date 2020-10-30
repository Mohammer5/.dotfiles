with import <nixpkgs> {};

stdenv.mkDerivation {
  name = "neo4j-env";

  buildInput = with pkgs; [
    neo4j
    nodejs-13_x
    yarn
  ];
}
