{ ... }: {
  imports = [
    ./network.nix
    ./printing.nix
    ./secondary-mounts.nix
    ./transmission.nix
    ./wm.nix
  ];
}
