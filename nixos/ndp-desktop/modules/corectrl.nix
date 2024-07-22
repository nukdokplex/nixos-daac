{ pkgs, ... }: {
  programs.corectrl = {
    enable = true;
    package = pkgs.corectrl;
  };
}