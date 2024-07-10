{ lib, ... }:
let
  vars = {
    terminal = "alacritty";
    fileManager = "pcmanfm-qt";
    webBrowser = "chromium";
    mediaPlayer = "spotify";
    textEditor = "codium";
    mailClient = "thunderbird";
    messengerApp1 = "vesktop";
    messengerApp2 = "telegram-desktop";
    notesApp = "logseq";
    passwordManager = "keepassxc";
    launcher = "bash $HOME/.config/rofi/bin/launcher.sh";
    powermenu = "bash $HOME/.config/rofi/bin/powermenu.sh";

    mainMod = "SUPER";

    mainLayout = "dwindle";

    screenTearing = false;
  };

in
{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  imports = [
    (import ./appearance.nix { inherit vars; })
    (import ./autorun.nix { inherit vars; })
    (import ./environment.nix { inherit vars; })
    (import ./gestures.nix { inherit vars; })
    (import ./input.nix { inherit vars; })
    (import ./layouts.nix { inherit vars; })
    (import ./misc.nix { inherit vars; })
    (import ./monitor.nix { inherit vars; })
    (import ./shortcuts.nix { inherit vars; })
    (import ./window_rules.nix { inherit vars; })
  ];
}
