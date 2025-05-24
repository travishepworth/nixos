#!/usr/bin/env bash

# script to switch between workspaces independant of monitor
# input: workspace number

# read argument to a variable
# check to make sure there is an argument
if [ -z "$1" ]; then
  echo "Usage: workspaceSwitching.sh <workspace number> [--move]"
  exit 1
fi

# get current active monitor
current_monitor=$(hyprctl -j activeworkspace | jq .monitor | tr -d '"')
workspace=$1
keyword="workspace"

echo current_monitor: "$current_monitor"

if [ "$2" == "--move" ]; then
  keyword="movetoworkspace"
fi

# switch to workspace
if [ "$current_monitor" == "DP-1" ]; then
  hyprctl dispatch ${keyword} "${workspace}"
elif [ "$current_monitor" == "DP-2" ]; then
  ((workspace += 10))
  hyprctl dispatch ${keyword} "${workspace}"
elif [ "$current_monitor" == "HDMI-A-1" ]; then
  ((workspace += 10))
  hyprctl dispatch ${keyword} "${workspace}"
elif [ "$current_monitor" == "DP-3" ]; then
  ((workspace += 20))
  hyprctl dispatch ${keyword} "${workspace}"
else
  echo "Monitor not found"
  exit 1
fi
