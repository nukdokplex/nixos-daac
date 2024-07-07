{ ... }: {
  programs.plasma = {
    enable = true true;

    hotkeys.commands = {
      "launch-alacritty" = {
        name = "Launch Alacritty";
        key = "Ctrl+Alt+T";
        command = "alacritty";
      };
    };
  };
}