with import <nixpkgs> {
  overlays = [ (import ../overlays/cypress-12.7.0.nix) ];
};

mkShell {
  # specify the packages you want in your shell environment
  buildInputs = [ cypress ];
  shellHook = ''
    export NODE_OPTIONS="--openssl-legacy-provider"
    export CYPRESS_RUN_BINARY="${pkgs.cypress}/bin"
  '';
}
