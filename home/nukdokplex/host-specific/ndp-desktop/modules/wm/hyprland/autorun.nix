{ vars }: {
  wayland.windowManager.hyprland.settings = {
    exec-once = with vars; [
      "lxqt-policykit-agent"
      "waybar"
      "[workspace 1 silent] ${terminal}"
      "[workspace 1 silent] ${webBrowser}"
      "[workspace 2 silent] ${messengerApp1}"
      "[workspace 2 silent] ${messengerApp2}"
      "[workspace 3 silent] ${textEditor}"
      "[workspace 4 silent] ${fileManager}"
      "[workspace 5 silent] ${notesApp}"
      "[workspace 7 silent] ${passwordManager}"
      "[workspace 8 silent] ${mailClient}"
      "[workspace 10 silent] ${mediaPlayer}"
    ];
  };
}
