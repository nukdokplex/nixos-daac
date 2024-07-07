{ pkgs, lib, ... }: {
  # this module sets default console settings for each host

  console = lib.mkDefault {
    enable = true;
    earlySetup = true;
    catppuccin.enable = true;
    font = "${pkgs.powerline-fonts}/share/consolefonts/ter-powerline-v32n.psf.gz";
    packages = with pkgs; [powerline-fonts];
    keyMap = "ru";
  };
}