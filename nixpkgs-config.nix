{ nixpkgs, ... }: {
  allowUnfreePredicate = pkg: builtins.elem (nixpkgs.lib.getName pkg) [
    "steam"
    "steam-original"
    "spotify"
    "Oracle_VM_VirtualBox_Extension_Pack"
  ];
}
