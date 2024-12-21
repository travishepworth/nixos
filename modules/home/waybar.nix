{ pkgs, ... }:

{
  home.packages = with pkgs; [ waybar ];

  programs.waybar = {
    enable = true;

    settings = {

      # General settings
      mainBar = {
        layer = "top";
        position = "top";
        reload_style_on_change = true;

        # Layour of the bar
        modules-left = [ "hyprland/window" ];
        modules-center = [
          "cpu"
          "memory"
          "disk"
          "temperature"
          "mpris"
          "hyprland/workspaces"
          "clock"
        ];
        modules-right = [
          "tray"
          "idle_inhibitor"
          "custom/colorpicker"
          "custom/microphone"
          "pulseaudio"
          "custom/logo"
        ];

        # Module config
        "hyprland/workspaces" = {
          disable-scroll = true;
          all-outputs = false;
          format = "{icon}";
          persistent-workspaces = {
            "DP-1" = [ 1 2 3 4 5 6 7 8 9 10 ];
            "DP-2" = [ 11 12 13 14 15 16 17 18 19 20 ];
          };

          format-icons = {
            "1" = "一";
            "2" = "二";
            "3" = "三";
            "4" = "四";
            "5" = "五";
            "6" = "六";
            "7" = "七";
            "8" = "八";
            "9" = "九";
            "10" = "十";
            "11" = "一";
            "12" = "二";
            "13" = "三";
            "14" = "四";
            "15" = "五";
            "16" = "六";
            "17" = "七";
            "18" = "八";
            "19" = "九";
            "20" = "十";
            "21" = "一";
            "22" = "二";
            "23" = "三";
            "24" = "四";
            "25" = "五";
            "26" = "六";
            "27" = "七";
            "28" = "八";
            "29" = "九";
            "30" = "十";
          };
        };

        "custom/logo" = {
          format = " ";
          exec = "echo ; echo 󰟡 power // blur";
          on-click = "swaync-client -t -sw";
          interval = "86400";
          tooltip = false;
        };

        "idle_inhibitor" = {
          format = "<span font='12'>{icon} </span>";
          format-icons = {
            activated = "󰈈";
            deactivated = "󰈉";
          };
        };

        "clock" = {
          format = "<span color = '#8ec07c'>{:%A, %B %d - %I:%M:%S %p}</span>";
          interval = 1;
          tooltip-format = ''

            <big>{:%Y %B}</big>
            <tt><small>{calendar}</small></tt>'';
          calendar-weeks-pos = "right";
          today-format = "<span color='#7645AD'><b><u>{}</u></b></span>";
          format-calendar = "<span color='#aeaeae'><b>{}</b></span>";
          format-calendar-weeks = "<span color='#aeaeae'><b>W{:%V}</b></span>";
          format-calendar-weekdays = "<span color='#aeaeae'><b>{}</b></span>";
        };

        "disk" = {
          interval = 30;
          format = "  {percentage_used}%";
          path = "/";
        };

        "memory" = { format = "   {percentage}%"; };

        "cpu" = {
          interval = 1;
          format = "  {usage}%";
          min-length = 6;
          max-length = 7;
          format-icons = [ "▁" "▂" "▃" "▄" "▅" "▆" "▇" "█" ];
        };

        "temperature" = {
          format = " {temperatureC}°C";
          format-critical = " {temperatureC}°C";
          interval = 1;
          critical-threshold = 80;
          on-click = "foot btop";
        };

        "mpris" = {
          # player = "spotify";
          format = "{status_icon}  |  {title} - {artist}";
          status-icons = {
            playing = " ";
            paused = " ";
            stopped = " ";
          };
        };

        # custom module to mute and unmute microphone on click
        "custom/microphone" = {
          format = "{}";
          exec =
            "wpctl get-volume @DEFAULT_SOURCE@ | grep -q MUTED && echo ' ' || echo ''";
          interval = 1;
          on-click = "wpctl set-mute @DEFAULT_SOURCE@ toggle";
        };

        "pulseaudio" = {
          format = "{volume}% {icon}";
          format-bluetooth = "󰂰";
          format-muted = "<span font='12'></span>";
          format-icons = {
            headphones = "";
            bluetooth = "󰥰 ";
            handsfree = "";
            headset = "󱡬";
            phone = "";
            portable = "";
            car = "";
            default = [ "" " " " " ];
          };
        };

        "tray" = {
          icon-size = 14;
          spacing = 1;
        };

        "hyprland/window" = {
          format = "( {class} )";
          rewrite = {
            "(.*) - Mozilla Firefox" = "🌎 $1";
            "(.*) - zsh" = "> [$1]";
          };
        };
      };
    };

    # Styling
    style = ''

      * {
        border: none;
        font-size: 14px;
        font-family: "MononokiNerdFond";
        min-height: 18px;
      }

      window#waybar {
        background: #282828;
        margin: 20px;
      }

      #custom-logo {
        padding: 1px 8px 0 10px;
      }

      #workspaces {
        border-radius: 8px;
        padding: 0 10px;
        margin: 0 2px 0 2px;
        background: #3c3836;
      }

      #workspaces button {
        background: #504945;
        padding: 0px 4px;
        margin: 1px 2px 1px 2px;
        border-radius: 20px;
        border-style: solid;
        border-width: 1px;
        border-color: #3c3836;
        color: #ebdbb2;
        transition: all 0.2s ease-in-out;
      }

      #workspaces button.empty {
        background: #3c3836;
        padding: 1px 4px;
        margin: 1px 2px;
        border-radius: 20px;
        border-style: solid;
        border-color: #3c3836;
        color: #928374;
      }

      #workspaces button.visible {
        padding: 0px 16px;
        margin: 1px 2px 1px 2px;
        border-color: #b16286;
        background: #b16286;
        transition: all 0.2s ease-in-out;
        color: #ebdbb2;
      }

      .modules-right {
        padding-left: 5px;
        border-radius: 8px;
        border-style: solid;
        border-width: 1px;
        border-color: #282828;
        margin-top: 4px;
        margin-bottom: 4px;
        margin-right: 8px;
        background: #282828;
      }

      .modules-center {
        margin-top: 4px;
        margin-bottom: 4px;
        border-radius: 8px;
        border-style: solid;
        border-width: 1px;
        border-color: #282828;
        background: #282828;
      }

      .modules-left {
        border-radius: 8px;
        border-style: solid;
        border-width: 1px;
        border-color: #3c3836;
        margin-top: 4px;
        margin-bottom: 4px;
        margin-left: 8px;
        background: #3c3836;
      }

      #battery,
      #custom-clipboard,
      #custom-colorpicker,
      #custom-powerDraw,
      #bluetooth,
      #pulseaudio,
      #network,
      #disk,
      #memory,
      #backlight,
      #custom-logo,
      #cpu,
      #temperature,
      #custom-weather,
      #idle_inhibitor,
      #custom-microphone,
      #mpris,
      #jack,
      #tray,
      #window,
      #clock {
        border-radius: 8px;
        background-color: #3c3836;
        color: #ebdbb2;
      }

      #tray {
        padding: 1px 6px
      }

      #disk,
      #cpu,
      #memory,
      #temperature,
      #mpris,
      #clock {
        border-radius: 8px;
        margin: 0 2px 0 2px;
        padding: 1px 6px 0px 6px;
      }

      #mpris {
        color: #ebdbb2;
      }

      #cpu {
        padding: 1px 3px 0px 3px;
        color: #d3869b;
      }

      #memory {
        color: #83a598;
      }

      #disk {
        color: #fabd2f;
      }

      #temperature {
        color: #8ec07c;
      }

      #clock {
        font-size: 16px;
        padding: 1px 8px 0px 8px;
      }

      #custom-weather {
        color: #fabd2f;
      }


      #pulseaudio,
      #custom-microphone,
      #network, 
      #idle_inhibitor,
      #custom-logo {
        border-radius: 8px;
        margin: 0 2px 0 2px;
        padding: 1px 6px 0px 6px;
      }

      #idle_inhibitor {
        padding: 1px 6px 0px 11px;
        color: #fabd2f;
      }

      #pulseaudio {
        padding: 1px 8px 0px 8px;
        color: #fe8019;
      }
      
      #custom-microphone {
        padding: 1px 8px 0px 8px;
        color: #d3869b;
      }

      #network {
        color: #8ec07c;
      }

      #custom-logo {
        font-size: 16px;
        padding: 1px 6px 0px 8px;
        color: #458588;
      }

      #window {
        padding: 1px 8px 0px 8px;
      }


      #temperature.critical,
      #pulseaudio.muted {
        color: #cc241d;
        padding-top: 0;
      }

      #clock {
        color: #5fd1fa;
      }

      #battery.charging {
        color: #ffffff;
        background-color: #26a65b;
      }

      #battery.warning:not(.charging) {
        background-color: #ffbe61;
        color: black;
      }

      #battery.critical:not(.charging) {
        background-color: #f53c3c;
        color: #ffffff;
        animation-name: blink;
        animation-duration: 0.5s;
        animation-timing-function: linear;
        animation-iteration-count: infinite;
        animation-direction: alternate;
      }

      @keyframes blink {
        to {
          background-color: #ffffff;
          color: #000000;
        }
      }
    '';
  };
}
