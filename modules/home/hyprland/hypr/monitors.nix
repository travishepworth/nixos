{ inputs, pkgs, ... }:

{
  wayland.windowManager.hyprland.settings = {
    monitor = [
      ",preferred,auto,1"
      "DP-1, 3440x1440@144, 0x0, 1"
      "DP-2, 1920x1080@144, -1920x476, 1"
      "HDMI-A-2, 1280x600@60, 0x1440, 1"
    ];
    workspace = [
      "1, monitor:[DP-1], default:true"
      "2, monitor:[DP-1], default:false"
      "3, monitor:[DP-1], default:false"
      "4, monitor:[DP-1], default:false"
      "5, monitor:[DP-1], default:false"
      "6, monitor:[DP-1], default:false"
      "7, monitor:[DP-1], default:false"
      "8, monitor:[DP-1], default:false"
      "9, monitor:[DP-1], default:false"
      "10, monitor:[DP-1], default:false"

      "11, monitor:[DP-2], default:true"
      "12, monitor:[DP-2], default:false"
      "13, monitor:[DP-2], default:false"
      "14, monitor:[DP-2], default:false"
      "15, monitor:[DP-2], default:false"
      "16, monitor:[DP-2], default:false"
      "17, monitor:[DP-2], default:false"
      "18, monitor:[DP-2], default:false"
      "19, monitor:[DP-2], default:false"
      "20, monitor:[DP-2], default:false"
    ];
  };
}
