{ pkgs, ... }: {

  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;

    extensions = with pkgs.vscode-extensions; [
      (catppuccin.catppuccin-vsc.override {
        accent = "green";
        boldKeywords = true;
        italicComments = true;
        italicKeywords = true;
        extraBordersEnabled = false;
        workbenchMode = "default";
        bracketMode = "rainbow";
        colorOverrides = { };
        customUIColors = { };
      })
      catppuccin.catppuccin-vsc-icons
      jnoortheen.nix-ide
      naumovs.color-highlight
    ];

    userSettings = {
      "editor.fontFamily" = "JetBrainsMono Nerd Font Mono";
      "terminal.integrated.fontFamily" = "JetBrainsMono Nerd Font Mono";
      "editor.semanticHighlighting.enabled" = true;

      # disable paste and enable multicursor with middle mouse button
      "editor.selectionClipboard" = false;

      # prevent VSCode from modifying the terminal colors
      "terminal.integrated.minimumContrastRatio" = 1;
      "window.titleBarStyle" = "custom";

      # catppuccin settings
      "workbench.colorTheme" = "Catppuccin Mocha";
      "catppuccin.customUIColors" = {
        "mocha" = {
          "statusBar.foreground" = "accent";
        };
      };
      "window.commandCenter" = false;
      "window.menuBarVisibility" = "compact";
      "workbench.layoutControl.enabled" = false;
      "window.dialogStyle" = "custom";
    };
  };
}
