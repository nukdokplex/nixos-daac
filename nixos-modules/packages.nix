{ pkgs, ...}: {
  environment.systemPackages = with pkgs; [
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
    killall
    inotify-tools
    
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
    catppuccinifier-gui

    # essentials
    keepassxc
    logseq
    syncthing
    telegram-desktop
    vesktop
    qbittorrent
    rofi-wayland

    # entertainment
    cmatrix

    # style
    catppuccin-cursors.mochaGreen

    # development
    nil
    nixd
    nixpkgs-fmt
    niv

    dig
  ];
}