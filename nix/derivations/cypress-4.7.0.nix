{
  pkgs ? import <nixpkgs> {},
}:

let
  stdenv = pkgs.stdenv;
  fetchzip = pkgs.fetchzip;
  autoPatchelfHook = pkgs.autoPatchelfHook;
  xorg = pkgs.xorg;
  gtk2 = pkgs.gtk2;
  gnome2 = pkgs.gnome2;
  gtk3 = pkgs.gtk3;
  nss = pkgs.nss;
  alsaLib = pkgs.alsaLib;
  udev = pkgs.udev;
  unzip = pkgs.unzip;
  wrapGAppsHook = pkgs.wrapGAppsHook;
in
stdenv.mkDerivation rec {
  pname = "cypress";
  version = "4.7.0";

  src = fetchzip {
    url = "https://cdn.cypress.io/desktop/${version}/linux-x64/cypress.zip";
    sha256 = "1lyhwy4rg6gdsj4590ya5v27lmyz6hnn4dhs51dq5i069rsw9qw4";
  };

  # don't remove runtime deps
  dontPatchELF = true;

  nativeBuildInputs = [ autoPatchelfHook wrapGAppsHook ];

  buildInputs = with xorg; [
    libXScrnSaver libXdamage libXtst
  ] ++ [
    nss gtk2 alsaLib gnome2.GConf gtk3 unzip
  ];

  runtimeDependencies = [ udev.lib ];

  installPhase = ''
    mkdir -p $out/bin $out/opt/cypress
    cp -vr * $out/opt/cypress/
    # Let's create the file binary_state ourselves to make the npm package happy on initial verification.
    # Cypress now verifies version by reading bin/resources/app/package.json
    mkdir -p $out/bin/resources/app
    printf '{"version":"%b"}' $version > $out/bin/resources/app/package.json
    # Cypress now looks for binary_state.json in bin
    echo '{"verified": true}' > $out/binary_state.json
    ln -s $out/opt/cypress/Cypress $out/bin/Cypress
  '';

  meta = with stdenv.lib; {
    description = "Fast, easy and reliable testing for anything that runs in a browser";
    homepage = "https://www.cypress.io";
    license = licenses.mit;
    platforms = ["x86_64-linux"];
    maintainers = with maintainers; [ tweber mmahut ];
  };
}