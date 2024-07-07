{ stateVersion, ... }: {
  imports = [
    ./hardware-configuration.nix
    ./packages.nix
    ./modules
  ];

  networking.hostName = "ndp-desktop";

  time.timeZone = "Asia/Yekaterinburg";

  system.stateVersion = stateVersion;
}
