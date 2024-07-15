{ ... }: {
  imports = [
    ./graphics.nix
    ./gvfs.nix
    ./network.nix
    ./printing.nix
    ./secondary-mounts.nix
    ./virtualisation.nix
    ./wm.nix
    ./sound.nix
  ];
}
