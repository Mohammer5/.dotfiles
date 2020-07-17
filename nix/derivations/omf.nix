{
  pkgs ? import <nixpkgs> {},
}:

let
  stdenv = pkgs.stdenv;
  # fetchFromGitHub = pkgs.fetchFromGitHub;
  fetchgit = pkgs.fetchgit;
in
stdenv.mkDerivation rec {
  name = "omf";

  src = fetchgit {
    url = "https://github.com/oh-my-fish/oh-my-fish";
    rev = "4ff9981ac2082e2c06f37ce5c8ac344ee51605ad";
    sha256 = "0r3fc29r816l3fjih6p5fzib25b962y1r3yq33fh3jkl54svmimz";
  };

  buildInputs = [
    #pkgs.echo
    # pkgs.ls
  ];

  phases = "installPhase";

  installPhase = ''
    mkdir -p $out/bin
    patchShebangs $src/bin/install
    $src/bin/install \
      --offline \
      --path=$out/bin
  '';
}
