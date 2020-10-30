with import <nixpkgs> {};

stdenv.mkDerivation {
  name = "clojure-env";

  buildInputs = with pkgs; [
    clojure
    leiningen
    neo4j
  ];
}
