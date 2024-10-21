{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Desktop related
    swaynotificationcenter
    networkmanagerapplet
    rofi-wayland
    blueman
    swww
    xdg-user-dirs
    brightnessctl
    pamixer
    playerctl
    wlogout

    # Utils
    ripgrep
    fd
    appimage-run
    killall
    swappy
    wf-recorder

    # Game stuff
    asdf-vm
    gamemode
    gamescope
    uptimed

    # Text related stuff
    wl-clipboard
    jetbrains-mono
    font-manager
    material-design-icons
    material-symbols
  ];
}
