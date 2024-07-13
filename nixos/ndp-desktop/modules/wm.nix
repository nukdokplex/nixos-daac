{ pkgs, ... }: {
  programs.sway = {
    enable = true;
    xwayland.enable = true;
    package = pkgs.sway;
  };
}
