{ inputs, pkgs, ... }:

{
  wayland.windowManager.hyprland.settings = {
    general = {
      gaps_in = 3;
      gaps_out = 6;
      border_size = 1;
      resize_on_border = true;
      "col.active_border" = "rgb(b16286)";
      "col.inactive_border" = "rgb(83a598)";
      layout = "dwindle";
    };

    dwindle = {
      preserve_split = true;
      pseudotile = true;
      smart_split = true;
      smart_resizing = true;
    };

    decoration = {
      rounding = 20;
      active_opacity = 1.0;
      inactive_opacity = 0.95;
      fullscreen_opacity = 1.0;

      dim_inactive = true;
      dim_strength = 0.1;

      # drop_shadow = true;
      # shadow_range = 1;
      # shadow_render_power = 1;
      # "col.shadow" = "rgb(181926)";
      # "col.shadow_inactive" = "0x50000000";

      blur = {
        enabled = true;
        size = 7;
        passes = 2;
        xray = true;
        ignore_opacity = true;
        new_optimizations = true;
      };
    };

    animations = {
      enabled = true;

      bezier = [
        "myBezier, 0.05, 0.9, 0.1, 1.05"
        "linear, 0.0, 0.0, 1.0, 1.0"
        "wind, 0.05, 0.9, 0.1, 1.05"
        "winIn, 0.1, 1.1, 0.1, 1.1"
        "winOut, 0.3, -0.3, 0, 1"
        "slow, 0, 0.85, 0.3, 1"
        "overshot, 0.7, 0.6, 0.1, 1.1"
        "bounce, 1.1, 1.6, 0.1, 0.85"
        "sligshot, 1, -1, 0.15, 1.25"
        "nice, 0, 6.9, 0.5, -4.20"
        "md3_decel, 0.05, 0.7, 0.1, 1"
      ];

      animation = [
        "windowsIn, 1, 5, slow, popin"
        "windowsOut, 1, 5, winOut, popin"
        "windowsMove, 1, 5, wind, slide"
        "fade, 1, 5, overshot"
        "workspaces, 1, 5, wind, slide"
        "windows, 1, 5, bounce, popin"

        "specialWorkspace, 1, 3, md3_decel, slidevert"
      ];
    };

    input = {
      kb_layout = "us";
      repeat_rate = 50;
      repeat_delay = 300;
      numlock_by_default = 1;
      left_handed = 0;
      follow_mouse = 1;
      float_switch_override_focus = 0;
      accel_profile = "flat";
    };

    binds = {
      scroll_event_delay = 0;
    };

    misc = {
      disable_hyprland_logo = true;
      disable_splash_rendering = true;
      mouse_move_enables_dpms = true;
      enable_swallow = true;
      focus_on_activate = true;
      swallow_regex = "^(kitty)$";
    };

    xwayland = { force_zero_scaling = true; };
  };
}
