## NOTE: This is a Nix overlay file taken and modified from:
##
## https://gist.github.com/r-k-b/2485f977b476aa3f76a47329ce7f9ad4
##
##
## When Cypress starts, it copies some files into
##
## ~/.config/Cypress/cy/production/browsers/chrome-stable/interactive/CypressExtension/
##
## ... from the Nix Store, one of which it attempts to modify immediately
## after. As-is, this fails because the copied file keeps the
## read-only flag it had in the Store.
##
## Luckily, the code responsible is a plain text script that we can
## easily patch:
final: prev: {
  cypress = prev.cypress.overrideAttrs (oldAttrs: rec {
    pname = "cypress";
    version = "12.1.0";

    src = prev.fetchzip {
      url = "https://cdn.cypress.io/desktop/${version}/linux-x64/cypress.zip";
      sha256 = "1jbjsgb3msjlx0y6wjvb99n3v009sc0nq19grlad57f2p5y0iy09";
      ## Note: sha256 is computed via (note the version):
      ##
      ## nix-prefetch-url --unpack https://cdn.cypress.io/desktop/12.1.0/linux-x64/cypress.zip
    };
  });
}
