{ pkgs, ... }: {
  services.desktopManager.plasma6 = {
    enable = true;
    notoPackage = pkgs.noto-fonts;
  };
  environment.plasma6.excludePackages = with pkgs; [
    kdePackages.konsole
  ];
}