{ inputs, ... }:

{
  services.hypridle = {
    enable = true;

    settings = {
      general = {
        lock_cmd =
          "pidof hyprlock || hyprlock"; # avoid starting multiple hyprlock instances.
        before_sleep_cmd = "loginctl lock-session"; # lock before suspend.
        after_sleep_cmd = "hyprctl dispatch dpms on";
      };

      listener = [
        {
          timeout = "300"; # 5 min
          on-timeout =
            "loginctl lock-session"; # lock screen when timeout has passed
        }
        {
          timeout = "360"; # 6 min
          on-timeout =
            "hyprctl dispatch dmps off"; # I LOVE hdmi monitors
          on-resume = "hyprctl dispatch dmps on";
        }
      ];
    };
  };
}
