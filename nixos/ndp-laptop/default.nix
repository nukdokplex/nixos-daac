{ stateVersion, ... }: {
  imports = [
    ./hardware-configuration.nix
    ./packages.nix
    ./modules
  ];

  networking.hostName = "ndp-laptop";

  time.timeZone = "Asia/Yekaterinburg";

  system.stateVersion = stateVersion;
}