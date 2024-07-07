{ osConfig, ... }: {
  home = {
    username = "nukdokplex";
    homeDirectory = "/home/nukdokplex";
    stateVersion = "24.05";
  };

  catppuccin.flavor = "mocha";
  catppuccin.accent = "green";

  imports = [
    ./modules
    ./host-specific/${osConfig.networking.hostName}
  ];
}