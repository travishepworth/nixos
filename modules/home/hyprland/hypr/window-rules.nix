{ inputs, pkgs, ... }:

{
  wayland.windowManager.hyprland.settings = {
    windowrule = [
      # Floating random shit
      "float, org.kde.polkit-kde-authentication-agent-1"
      "float, nm-connection-editor|blueman-manager"
      "float, nwg-look|qt5ct|mpv"
      "float, onedriver|onedriver-launcher"
      "float, eog"
      "float, zoom"
      "float, rofi"
      "float, yad"

      # settings
      "float, org.gnome.Settings"
      "size 35% 50%, org.gnome.Settings"

      # file explorer
      "float, nemo"
      "size 35% 50%, nemo"

      # file picker
      "float, xdg-desktop-portal-gtk"
      "size 35% 50%, xdg-desktop-portal-gtk"

      # Bluetooth
      "float, ^(.*blueberry.*)$"
      "size 35% 50%, ^(.*blueberry.*)$"

      # image viewer / qimgv
      "float, ^(.*qimgv.*)$"
      "size 35% 50%, qimgv"

      #Audio apps
      "float, pavucontrol"
      "float, easyeffects"
      "center,^(pavucontrol) "
      "size 35% 50%, pavucontrol"
      "size 35% 50%, easyeffects"
      "size 35% 0%, mixyr"

      # Bitwarden
      "float, ^(.*[Bb]itwarden.*)$"
      "center, ^(.*[Bb]itwarden.*)$"

      # Gamescope
      "noblur,gamescope"
      "fullscreen,gamescope"
      "workspace 10 silent,^(.*gamescope.*)$"
    ];

    windowrulev2 = [
      # More random shit
      "monitor HDMI-A-1, title:^(.*Discord.*)$"
      "opacity 0.9 0.6, class:^([Rr]ofi)$"
      "opacity 1 0.95, class:^(kitty)$"
      "opacity 1 override 1 override, title:^(btop)$"
      "opacity 1 override 1 override, title:^(.*nvim.*)$"
      "opacity 1 override 1 override, title:^(.*KiCad.*)$"
      "opacity 0.9 0.7, class:^(yad)$"
      "opacity 0.9 0.7, class:^(com.obsproject.Studio)$"
      "opacity 0.9 0.7, class:^([Aa]udacious)$"

      # Make steam subwindows float
      "float, class:^steam$"
      "tile, class:^steam$, title:^Steam$"

      # Picture in Picture related
      "opacity 0.95 0.75,title:^(Picture-in-Picture)$ # for opacity: [focus num] [bg num]"
      "pin,title:^(Picture-in-Picture)$ "
      "float, title:^(Picture-in-Picture)$"
      "size 25% 25%,title:^(Picture-in-Picture)$ "
      "move 72% 7%,title:^(Picture-in-Picture)$ "
    ];
  };
}
