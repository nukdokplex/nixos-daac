{ pkgs, ... }: {
  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.qemu_kvm;
      runAsRoot = true;
      swtpm.enable = true;
      ovmf = {
        enable = true;
        packages = [
          pkgs.OVMFFull.fd
        ];
      };
    };
  };
  users.users.nukdokplex.extraGroups =  [ "libvirtd" ];

  programs.virt-manager.enable = true;
}
