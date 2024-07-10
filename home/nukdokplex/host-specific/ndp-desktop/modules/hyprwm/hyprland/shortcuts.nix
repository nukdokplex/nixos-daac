{ vars }: {
  wayland.windowManager.hyprland.settings = {
    bind = with vars; [
      "${mainMod}, Q, exec, alacritty"
      "${mainMod}, C, killactive,"
      "${mainMod}, M, exit,"
      "${mainMod}, E, exec, ${fileManager}"
      "${mainMod}, W, exec, ${webBrowser}"
      "${mainMod}, R, exec, ${launcher}"
      "${mainMod}, P, pseudo,"
      "${mainMod}, Z, togglesplit,"
      "${mainMod}, V, togglefloating"
      "${mainMod}, F, fullscreen"
      "${mainMod} SHIFT, F, fakefullscreen"
      "${mainMod}, PRINT, exec, hyprshot -m window -o $HOME/Screenshot" # screenshot window
      ", PRINT, exec, hyprshot -m output -o $HOME/Screenshots" # screenshot monitor
      "${mainMod} SHIFT, S, exec, hyprshot -m region -o $HOME/Screenshots" # screenshot area
      "${mainMod} SHIFT, P, exec, hyprpicker --autocopy --format=hex"

      # Move focus with mainMod + arrow keys
      "${mainMod}, left, movefocus, l"
      "${mainMod}, right, movefocus, r"
      "${mainMod}, up, movefocus, u"
      "${mainMod}, down, movefocus, d"

      # Moving windows
      "${mainMod} SHIFT, left,  swapwindow, l"
      "${mainMod} SHIFT, right, swapwindow, r"
      "${mainMod} SHIFT, up,    swapwindow, u"
      "${mainMod} SHIFT, down,  swapwindow, d"

      # Window resizing                     X  Y
      "${mainMod} CTRL, left, resizeactive, -60 0"
      "${mainMod} CTRL, right, resizeactive, 60 0"
      "${mainMod} CTRL, up, resizeactive, 0 -60"
      "${mainMod} CTRL, down, resizeactive, 0 60"

      # Switch workspaces with mainMod + [0-9]
      "${mainMod}, 1, workspace, 1"
      "${mainMod}, 2, workspace, 2"
      "${mainMod}, 3, workspace, 3"
      "${mainMod}, 4, workspace, 4"
      "${mainMod}, 5, workspace, 5"
      "${mainMod}, 6, workspace, 6"
      "${mainMod}, 7, workspace, 7"
      "${mainMod}, 8, workspace, 8"
      "${mainMod}, 9, workspace, 9"
      "${mainMod}, 0, workspace, 10"

      # Switch workspaces with mainMod + numpad [0-9]
      "${mainMod}, KP_End, workspace, 1"
      "${mainMod}, KP_Down, workspace, 2"
      "${mainMod}, KP_Next, workspace, 3"
      "${mainMod}, KP_Left, workspace, 4"
      "${mainMod}, KP_Begin, workspace, 5"
      "${mainMod}, KP_Right, workspace, 6"
      "${mainMod}, KP_Home, workspace, 7"
      "${mainMod}, KP_Up, workspace, 8"
      "${mainMod}, KP_Prior, workspace, 9"
      "${mainMod}, KP_Insert, workspace, 10"

      # Move active window to a workspace with mainMod + SHIFT + [0-9]
      "${mainMod} SHIFT, 1, movetoworkspace, 1"
      "${mainMod} SHIFT, 2, movetoworkspace, 2"
      "${mainMod} SHIFT, 3, movetoworkspace, 3"
      "${mainMod} SHIFT, 4, movetoworkspace, 4"
      "${mainMod} SHIFT, 5, movetoworkspace, 5"
      "${mainMod} SHIFT, 6, movetoworkspace, 6"
      "${mainMod} SHIFT, 7, movetoworkspace, 7"
      "${mainMod} SHIFT, 8, movetoworkspace, 8"
      "${mainMod} SHIFT, 9, movetoworkspace, 9"
      "${mainMod} SHIFT, 0, movetoworkspace, 10"

      # Move active window to a workspace with mainMod + SHIFT + Numpad [0-9]
      "${mainMod} SHIFT, KP_End, movetoworkspace, 1"
      "${mainMod} SHIFT, KP_Down, movetoworkspace, 2"
      "${mainMod} SHIFT, KP_Next, movetoworkspace, 3"
      "${mainMod} SHIFT, KP_Left, movetoworkspace, 4"
      "${mainMod} SHIFT, KP_Begin, movetoworkspace, 5"
      "${mainMod} SHIFT, KP_Right, movetoworkspace, 6"
      "${mainMod} SHIFT, KP_Home, movetoworkspace, 7"
      "${mainMod} SHIFT, KP_Up, movetoworkspace, 8"
      "${mainMod} SHIFT, KP_Prior, movetoworkspace, 9"
      "${mainMod} SHIFT, KP_Insert, movetoworkspace, 10"

      # Scroll through existing workspaces with mainMod + scroll
      "${mainMod}, mouse_down, workspace, e+1"
      "${mainMod}, mouse_up, workspace, e-1"

      # rofi powermenu
      "CTRL + ALT, Delete, exec, ${powermenu}"
    ];

    bindm = with vars; [
      # Move/resize windows with mainMod + LMB/RMB and dragging
      "${mainMod}, mouse:272, movewindow"
      "${mainMod}, mouse:273, resizewindow"
    ];
  };
}
