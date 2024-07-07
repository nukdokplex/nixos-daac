{ lib, ... }: {
  i18n.defaultLocale = lib.mkDefault "ru_RU.UTF-8";

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  catppuccin = {
    flavor = "mocha";
    accent = "green";
  };

  imports = [
    ./packages.nix
    ./modules
  ];
}
