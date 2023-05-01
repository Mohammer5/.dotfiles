with import <nixpkgs> {
  overlays = [ (import ../overlays/cypress-12.7.0.nix) ];
};

mkShell {
  # specify the packages you want in your shell environment
  buildInputs = [ cypress ];
}
