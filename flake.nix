{
  description = "NukDokPlex's DaaC (Desktop as a Code) configuration using NixOS flakes feature";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs?ref=nixos-24.05";
    };

    nixpkgs-unstable = {
      url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    };

    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

    ez-configs = {
      url = "github:ehllie/ez-configs";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
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

  outputs = inputs: inputs.flake-parts.lib.mkFlake
    { inherit inputs; }
    {
      imports = [
        inputs.ez-configs.flakeModule
      ];

      systems = [
        "x86_64-linux"
      ];

      ezConfigs = {
        root = ./.;
        home.extraSpecialArgs = {
          assetsDirectory = ./assets;
          inherit inputs;
        };
        nixos.specialArgs = {
          assetsDirectory = ./assets;
          inherit inputs;
        };
      };


      perSystem = { pkgs, lib, system, ... }: {
        _module.args.pkgs = import inputs.nixpkgs {
          inherit system;
        };
      };
    };
}
