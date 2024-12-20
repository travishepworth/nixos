{ ... }:

{
  imports = 
    [(import ./hyprland.nix)]
    ++[(import ./terraria-server.nix)]
    ++[(import ./factorio-server.nix)]
    ++[(import ./gaming.nix)];
}
