{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # File management
    wev
    nemo
    xclicker
    # peazip
    qdirstat
    qbittorrent
    discord

    # File viewing / editing
    onlyoffice-bin
    zathura
    gimp
    mpv
    qimgv

    # Settings applications
    blueberry
    via
    openrgb-with-all-plugins

    # Fonts
    font-manager
    bemoji

    # Games
    heroic
    vesktop
    calibre

    # Development
    btop
    lazygit
    kicad

    # Other
    bitwarden-desktop
    # bambu-studio
    orca-slicer
    slack
    librewolf
    ungoogled-chromium
    obs-studio
    stellarium
  ];
}
