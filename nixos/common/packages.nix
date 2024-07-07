{ pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # terminals
    alacritty
    cool-retro-term

    # system tools
    btrfs-progs
    cryptsetup
    cups
    e2fsprogs
    glxinfo
    htop
    btop
    ranger
    sbctl
    smartmontools
    tmux
    unzip
    zip
    zsh
    gnutar
    unrar-free

    # browser
    chromium
    
    # misc tools
    android-tools
    fastfetch
    gimp-with-plugins
    git
    scrcpy

    # media
    handbrake
    imv
    inkscape
    kdenlive
    mpv
    obs-studio

    # essentials
    keepassxc
    logseq
    syncthing
    telegram-desktop
    vesktop

    # entertainment
    cmatrix

    # style
    catppuccin-cursors.mochaGreen

    # development
    nil
    nixd
    nixpkgs-fmt

    dig
  ];
}