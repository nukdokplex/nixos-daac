{ config, ... }: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;

    shellAliases = {
      "ll" = "ls -l";
      "hms" = "home-manager switch --flake ~/ndp-nixos-daac/.#nukdokplex";
      "nrb" = "sudo nixos-rebuild boot --flake ~/ndp-nixos-daac/.#ndp-desktop";
      "nrs" = "sudo nixos-rebuild switch --flake ~/ndp-nixos-daac/.#ndp-desktop";
    };

    oh-my-zsh = {
      enable = true;
      theme = "agnoster";
      plugins = [ "git" "sudo" "systemd" ];
    };
  };
}