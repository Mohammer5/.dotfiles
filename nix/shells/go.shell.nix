with import <nixpkgs> {};

stdenv.mkDerivation {
  name = "golang";

  buildInputs = with pkgs; [
    go
    gcc
  ];
}
