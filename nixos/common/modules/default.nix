{ ... }: {
  imports = [
    ./bluetooth.nix
    ./console.nix
    ./env.nix
    ./fonts.nix
    ./gamemode.nix
    ./misc.nix
    ./network.nix
    ./openssh.nix
    ./sddm.nix
    ./services.nix
    ./sound.nix
    ./user.nix
    ./zsh.nix
  ];
}