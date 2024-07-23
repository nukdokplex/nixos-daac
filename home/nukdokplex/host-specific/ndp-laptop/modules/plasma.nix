{ ... }: {
  programs.plasma = {
    enable = true;

    hotkeys.commands = {
      "launch-alacritty" = {
        name = "Launch Alacritty";
        key = "Ctrl+Alt+T";
        command = "alacritty";
      };
    };
  };
}