{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs/nixos-unstable;

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }: 
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    nixosConfigurations = {
      laptopYoga = nixpkgs.lib.nixosSystem {
        inherit system;

        modules = [
          ./configuration.nix
          ./hardware-configuration.nix
          ./modules/xserver.nix
          ./modules/environment-laptopYoga.nix
          ./modules/audio.nix
          ./modules/networking.nix
          ./modules/systemPackages.nix
          ./modules/yoga-laptop-hardware.nix
          ./modules/direnv.nix
          ./modules/systemState.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.gerkules = import ./home.nix;
          }
        ];
      };
    };

    devShells.${system} = {
      js = pkgs.mkShell {
        name = "Standard JS development";
        buildInputs = with pkgs; [
          nodejs
          yarn
        ];
      };

      clojure = pkgs.mkShell {
        name = "Standard clojure development";
        buildInputs = with pkgs; [
          clojure
          leiningen
        ];
      };
    };
  };
}
