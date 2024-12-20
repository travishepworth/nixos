{ ... }:

{
  imports = 
    [(import ./hyprland.nix)]
    ++[(import ./terraria-server.nix)]
    ++[(import ./factorio/factorio-server.nix)]
    ++[(import ./gaming.nix)];
}
