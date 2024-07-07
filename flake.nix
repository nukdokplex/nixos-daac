{
  description = "NukDokPlex's DaaC (Desktop as a Code) configuration using NixOS flakes feature";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs?ref=nixos-24.05";
    };

    nixpkgs-unstable = {
      url = "github:nixos/nixpkgs?ref=nixos-unstable";
    };

    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.4.1";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager?ref=release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    catppuccin = {
      url = "github:catppuccin/nix";
    };

    spicetify-nix = {
      url = "github:the-argus/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    catppuccin-vsc = {
      url = "github:catppuccin/vscode";
    };
  };

  outputs = inputs@{ nixpkgs, nixpkgs-unstable, lanzaboote, home-manager, catppuccin, ... }:
    let
      system = "x86_64-linux";
      stateVersion = "24.05";

      nixpkgs-config = {
        inherit system;
        config.allowUnfreePredicate = pkg: builtins.elem (nixpkgs.lib.getName pkg) [
          "steam"
          "steam-original"
          "spotify"
          "epson_201207w"
        ];
        overlays = [
          inputs.catppuccin-vsc.overlays.default
        ];
      };

      pkgs = import nixpkgs nixpkgs-config;
      pkgs-unstable = import nixpkgs-unstable {
        inherit system;
      };
    in
    {
      nixosConfigurations.ndp-desktop = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit pkgs-unstable;
          inherit stateVersion;
          flakeInputs = inputs;
        };

        inherit pkgs;

        modules = [
          ./nixos/common
          ./nixos/ndp-desktop
          lanzaboote.nixosModules.lanzaboote
          catppuccin.nixosModules.catppuccin
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;

              users.nukdokplex = {
                imports = [
                  ./home/nukdokplex
                  catppuccin.homeManagerModules.catppuccin
                  inputs.spicetify-nix.homeManagerModule
                ];
              };

              extraSpecialArgs = {
                inherit pkgs-unstable;
                inherit stateVersion;
                inherit (inputs) spicetify-nix;
                flakeInputs = inputs;
                flakeRootPath = ./.;
              };
            };
          }
        ];
      };
      nixosConfigurations.ndp-laptop = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit pkgs-unstable;
          inherit stateVersion;
          flakeInputs = inputs;
        };

        inherit pkgs;

        modules = [
          ./nixos/common
          ./nixos/ndp-laptop
          lanzaboote.nixosModules.lanzaboote
          catppuccin.nixosModules.catppuccin
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;

              users.nukdokplex = {
                imports = [
                  ./home/nukdokplex
                  catppuccin.homeManagerModules.catppuccin
                  inputs.spicetify-nix.homeManagerModule
                ];
              };

              extraSpecialArgs = {
                inherit pkgs-unstable;
                inherit stateVersion;
                inherit (inputs) spicetify-nix;
                flakeInputs = inputs;
                flakeRootPath = ./.;
              };
            };
          }
        ];
      };
    };
}
