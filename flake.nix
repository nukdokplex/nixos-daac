{
  description = "NukDokPlex's DaaC (Desktop as a Code) configuration using NixOS flakes feature";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs?ref=nixos-unstable";
    };

    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.4.1";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    catppuccin = {
      url = "github:catppuccin/nix";
    };

    hyprland = {
      url = "github:hyprwm/Hyprland";
    };

    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

    spicetify-nix = {
      url = "github:the-argus/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    epson_201310w = {
      url = "github:nukdokplex/epson_201310w";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ nixpkgs, lanzaboote, home-manager, catppuccin, ... }:
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
          "Oracle_VM_VirtualBox_Extension_Pack"
        ];
        config.permittedInsecurePackages = [
          "electron-27.3.11"
        ];
      };

      pkgs = import nixpkgs nixpkgs-config;
    in
    {
      nixosConfigurations.ndp-desktop = nixpkgs.lib.nixosSystem {
        specialArgs = {
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
                  inputs.plasma-manager.homeManagerModules.plasma-manager
                  inputs.spicetify-nix.homeManagerModule
                ];
              };

              extraSpecialArgs = {
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
