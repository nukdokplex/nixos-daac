{ ... }: {
  imports = [
    ./network.nix
    ./printing.nix
    ./secondary-mounts.nix
    ./wm.nix
    ./graphics.nix
    ./virtualisation.nix
  ];
}
