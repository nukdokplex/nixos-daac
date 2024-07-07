{ pkgs, ... }: {
  qt = {
    enable = true;
    platformTheme.name = "kvantum";
    style = {
      catppuccin.enable = true;
      name = "kvantum";
    };
  };
}
