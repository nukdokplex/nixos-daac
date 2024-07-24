{ config, inputs, lib, modulesPath, ... }: {

  # Sleipnir is perhaps the most famous horse in Norse mythology. As Odin’s 
  # eight-legged steed, Sleipnir is considered the best among horses. He’s
  # described as able to travel across land, sea, air, and even the world of
  # the dead. Sleipnir’s unusual form symbolizes his ability to transcend
  # normal physical boundaries.

  imports = [
    inputs.lanzaboote.nixosModules.lanzaboote
    inputs.catppuccin.nixosModules.catppuccin
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  networking.hostName = "sleipnir";
  time.timeZone = "Asia/Yekaterinburg";
  system.stateVersion = "24.05";
  nixpkgs.hostPlatform = "x86_64-linux";

  security.tpm2.enable = true;

  hardware.enableRedistributableFirmware = true;
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  powerManagement.cpuFreqGovernor = "performance";

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-label/NIXROOT";
      fsType = "ext4";
    };
    "/boot/efi" = {
      device = "/dev/disk/by-label/NIXBOOT";
      fsType = "vfat";
      options = [ "fmask=0022" "dmask=0022" ];
    };
  };
  swapDevices = [{ device = "/dev/disk/by-label/NIXSWAP"; }];

  nix = {
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      trusted-users = [
        "root"
        "nukdokplex"
      ];
    };

    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 7d";
    };
  };

  boot = {
    kernelModules = [ "kvm-intel" "amdgpu" ];
    extraModulePackages = [ ];
    kernelParams = [
      "libata.noacpi=1"
    ];
    initrd = {
      availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usb_storage" "usbhid" "sd_mod" "sr_mod" ];
      kernelModules = [ ];
      systemd.enable = true;
    };

    loader = {
      efi.canTouchEfiVariables = true;
      efi.efiSysMountPoint = "/boot/efi";
      systemd-boot.enable = lib.mkForce false; # workaround for lanzaboote
    };

    lanzaboote = {
      enable = true;
      pkiBundle = "/etc/secureboot";
    };
  };

  systemd.mounts = [
    {
      name = "data-archive.mount";
      enable = true;
      wantedBy = [ "multi-user.target" ];
      what = "/dev/disk/by-uuid/81534a78-20f8-4d78-8f5f-2134406cc300";
      where = "/data/archive";
      type = "ext4";
      options = "rw,nosuid,nodev,relatime,errors=remount-ro,x-mount.mkdir=0755";
    }
    {
      name = "data-downloads.mount";
      enable = true;
      wantedBy = [ "multi-user.target" ];
      what = "/dev/disk/by-uuid/87fadf5b-bd21-4f97-8a39-57b6632fd9d0";
      where = "/data/downloads";
      type = "ext4";
      options = "rw,nosuid,nodev,relatime,errors=remount-ro,x-mount.mkdir=0755";
    }
    {
      name = "data-virtual.mount";
      enable = true;
      wantedBy = [ "multi-user.target" ];
      what = "/dev/disk/by-uuid/efcf86fd-a475-4957-a99f-81946caf808d";
      where = "/data/virtual";
      type = "ext4";
      options = "rw,nosuid,nodev,noatime,errors=remount-ro,x-mount.mkdir=0755";
    }
    {
      name = "data-passport.mount";
      enable = true;
      wantedBy = [ "multi-user.target" ];
      what = "/dev/mapper/passport";
      where = "/data/passport";
      type = "ext4";
      options = "rw,nosuid,nodev,relatime,errors=remount-ro,x-mount.mkdir=0755";
    }
  ];
  environment.etc."crypttab".text = ''
    passport /dev/disk/by-label/PASSPORT none tpm2-device=auto,tpm2-pcrs=0+2+7+12
  '';
}
