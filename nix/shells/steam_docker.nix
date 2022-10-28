with import <nixpkgs> {};

stdenv.mkDerivation {
  name = "steam docker";

  # services.xserver.enable = true;
  virtualisation.docker.enable = true;

  buildInputs = with pkgs; [
    steam-run
  ];
}
