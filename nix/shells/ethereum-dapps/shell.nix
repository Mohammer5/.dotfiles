with import <nixpkgs> {};

let
  ganache = fetchurl {
    url = "https://github.com/trufflesuite/ganache/releases/download/v2.5.4/ganache-2.5.4-linux-x86_64.AppImage";
    sha256 = "foobar";
  };
in

stdenv.mkDerivation {
  name = "dapps";

  shellHook = ''
    alias ganache="appimage-run ${src.out}/https://github.com/trufflesuite/ganache/releases/download/v2.5.4/ganache-2.5.4-linux-x86_64.AppImage"
  '';

  buildInputs = with pkgs; [
    nodejs-13_x
    (yarn.override { nodejs = nodejs-13_x; })

    # needed to run ganache
    appimage-run
  ];
}
