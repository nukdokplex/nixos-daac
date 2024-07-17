{ pkgs, ... }: {
  programs.mangohud = {
    enable = true;
    settings = {
      full = true;
      toggle_hud = "Shift_R+F12";
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
