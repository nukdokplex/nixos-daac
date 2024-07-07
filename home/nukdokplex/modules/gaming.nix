{ pkgs, ... }: {
  programs.mangohud = {
    enable = true;
    settings = {
      full = true;
    };
  };

  home.packages = with pkgs; [
    (lutris.override {
      steamSupport = false; # enable steam to install with
    })
    wine
    winetricks
    steam
    mangohud
    r2modman
  ];
}
