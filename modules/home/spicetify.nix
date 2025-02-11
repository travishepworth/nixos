{ pkgs, lib, inputs, ... }:

{
  programs.spicetify =
    let spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
    in {
      enable = false;

      theme = spicePkgs.themes.text;
      colorScheme = "gruvbox";

      enabledExtensions = with spicePkgs.extensions; [
        trashbin
        shuffle
        groupSession
        skipStats
        beautifulLyrics
      ];
      enabledCustomApps = with spicePkgs.apps; [
        marketplace
        betterLibrary
        newReleases
        lyricsPlus
      ];
    };
}
