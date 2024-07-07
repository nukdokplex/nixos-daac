{ pkgs, ... }: {

  # before adding new package, notice that most of them could be placed in ./modules/*
  environment.systemPackages = with pkgs; [
    # file manager and essentials
    kdePackages.dolphin

    # styling
    libsForQt5.qtstyleplugin-kvantum

    quickemu
  ];
}