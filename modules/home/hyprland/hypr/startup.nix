{ inputs, pkgs, ... }:

{
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      # Startup
      "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
      "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"

      # starup apps
      "ags &"
      "hypridle &"
      "hyprpm reload"

      # wallpapers
      "swww query || swww-daemon"

      # Setting primary monitor
      "xrandr --output DP-1 --primary"

      # Equalizer
      "easyeffects --gapplication-service &"

      #clipboard manager
      "wl-paste --type text --watch cliphist store "

      # Move mouse to center monitor
      "hyprctl dispatch workspace 11"
    ];
  };
}
