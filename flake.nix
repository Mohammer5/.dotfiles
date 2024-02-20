{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs/nixos-unstable;
    nixpkgsTeams.url = github:NixOS/nixpkgs/23.05;

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, nixpkgsTeams, home-manager, ... }: 
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    # pkgs2305 = nixpkgsTeams.legacyPackages.${system};
    pkgs2305 = (import nixpkgsTeams {
      inherit system;
      config = {
        permittedInsecurePackages = ["nodejs-16.20.0"];
      };
    });
  in {
    nixosConfigurations = {
      laptopYoga = nixpkgs.lib.nixosSystem {
        inherit system;

        # environment.systemPackages = [
        #   nixpkgsTeams.legacyPackages.${system}.teams
        # ];

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

    devShells.${system} = let
      jsPackages = with pkgs; [nodejs yarn];
      node16 = pkgs2305.nodejs_16;
      yarn16 = pkgs2305.yarn.override { nodejs = node16; };
    in {
      js = pkgs.mkShell {
        name = "Standard JS development";
        buildInputs = jsPackages;
      };

      jsn16 = pkgs.mkShell {
        name = "JS with nodejs v16";
        buildInputs = [node16 yarn16];
      };

      cypress = pkgs.mkShell {
        name = "Cypress (latest) development";
        buildInputs = [pkgs.cypress] // jsPackages;
        shellHook = ''
          export NODE_OPTIONS="--openssl-legacy-provider"
          export CYPRESS_RUN_BINARY="${pkgs.cypress}/bin"
        '';
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
