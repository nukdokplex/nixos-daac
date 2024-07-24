{ lib, pkgs, config, inputs, ... }: {
  users = {
    users.nukdokplex = rec {
      name = "nukdokplex";
      home = "/home/${name}";
      isNormalUser = true;
      description = "${name} at ${config.networking.hostName}";
      extraGroups = [ "wheel" ]; # add user to sudo
      # it's highly recommended to use "users.extraGroups.group_name.members = [ "username" ];"
    };

    defaultUserShell = pkgs.zsh;
  };

  programs.zsh.enable = true;

  environment.variables = {
    EDITOR = "nano";
  };

  console = {
    enable = true;
    earlySetup = true;
    catppuccin.enable = true;
    font = "${pkgs.powerline-fonts}/share/consolefonts/ter-powerline-v32n.psf.gz";
    packages = with pkgs; [ powerline-fonts ];
    keyMap = "ru";
  };

  fonts.packages = with pkgs;[
    jetbrains-mono
    noto-fonts
    noto-fonts-lgc-plus
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-color-emoji
    noto-fonts-extra
    (nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" "JetBrainsMono" ]; })
  ];

  programs.gamemode.enable = true;
  users.extraGroups.gamemode.members = [ "nukdokplex" ];

  services.fstrim.enable = true;

  networking = {
    networkmanager.enable = true;
    nftables.enable = true;

    firewall = {
      enable = true;
      allowPing = true;
      allowedTCPPorts = [
        22000 # syncthing
      ];
    };
  };
  users.extraGroups.networkmanager.members = [ "nukdokplex" ];

  services.openssh = {
    enable = true;

    allowSFTP = true;
    authorizedKeysInHomedir = true;
    ports = [ 33727 ];
    openFirewall = true;

    settings = {
      PrintMotd = true;
      PermitRootLogin = "no";
      PasswordAuthentication = false;
      AllowGroups = [ "users" ];
    };
  };


  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;

    package = pkgs.kdePackages.sddm;

    catppuccin = {
      enable = true;
      font = "JetBrains Mono";
      fontSize = "14";
      assertQt6Sddm = true;
    };

    settings.Theme = {
      CursorTheme = "Catppuccin-Mocha-Green-Cursors";
      CursorSize = 32;
    };
  };

  # sound and bluetooth
  hardware.pulseaudio.enable = false;

  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
    jack.enable = true;
  };

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        Experimental = true;
      };
    };
  };

  # touchpads and other
  services.libinput.enable = true;
  users.extraGroups.input.members = [ "nukdokplex" ];

  # gvfs and similar
  services.gvfs.enable = true;
  services.udisks2.enable = true;
  services.devmon.enable = true;

  # graphics
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  # printing
  services.printing = {
    enable = true;
    logLevel = "debug";
    drivers = [
      inputs.epson_201310w.packages.x86_64-linux.default
    ];
  };
  hardware.printers.ensurePrinters = [
    {
      name = "Epson_L120_Series";
      location = "Home";
      deviceUri = "usb://EPSON/L120%20Series?serial=544E594B3132383744";
      model = "EPSON_L120.ppd";
    }
  ];

  imports = [
    ./docker.nix
    ./hyprland.nix
    ./virtualbox.nix
    ./packages.nix
  ];

  nixpkgs.config = import ../nixpkgs-config.nix { nixpkgs = inputs.nixpkgs; };
}
