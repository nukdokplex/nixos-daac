{ osConfig, pkgs, lib, ezModules, ... }: {
  home =
    let name = "nukdokplex"; in {
      username = osConfig.users.users.${name}.name;
      stateVersion = osConfig.system.stateVersion;
      homeDirectory = osConfig.users.users.${name}.home;
    };

  programs.git = {
    userName = "nukdokplex";
    userEmail = "nukdokplex@nukdokplex.ru";
  };

  imports = [
    ./hyprland.nix
    ./essentials.nix
    ./userdirs.nix
    ./waybar.nix
    ./zsh.nix
    (lib.mkIf (pkgs.tryImport { src = ./hosts/${osConfig.networking.hostName}; }) ./hosts/${osConfig.networking.hostName})
    (lib.mkIf (pkgs.tryImport { src = ./hosts/${osConfig.networking.hostName}.nix; }) ./hosts/${osConfig.networking.hostName}.nix)
  ];
}
