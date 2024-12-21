{ pkgs, inputs, ... }:

{

  imports = [
    (../../modules/home/calibrum.nix)
    inputs.spicetify-nix.homeManagerModules.default
  ];

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "travis";
  home.homeDirectory = "/home/travis";

  home.file = { ".config/rofi".source = ../../unmanagedDots/rofi; };

  # Default xdg applications
  xdg = {
    enable = true;
    mimeApps = {
      enable = true;
      defaultApplications = {
        "image/jpeg" = "qimgv.desktop";
        "image/png" = "qimgv.desktop";
        "image/gif" = "qimgv.desktop";
        "image/bmp" = "qimgv.desktop";
        "image/svg+xml" = "qimgv.desktop";
        "image/webp" = "qimgv.desktop";

        "video/mp4" = "mpv.desktop";
        "video/x-matroska" = "mpv.desktop";
        "video/x-msvideo" = "mpv.desktop";
        "video/x-flv" = "mpv.desktop";
        "video/quicktime" = "mpv.desktop";
        "video/x-ms-wmv" = "mpv.desktop";
        "video/webm" = "mpv.desktop";

        "application/pdf" = "zathura.desktop";
        # set default brower to librewolf for xdg portal opening
        "x-scheme-handler/http" = "librewolf.desktop";
        "x-scheme-handler/https" = "librewolf.desktop";
        "x-scheme-handler/about" = "librewolf.desktop";
        "x-scheme-handler/unknown" = "librewolf.desktop";
      };
    };
  };

  gtk.enable = true;

  gtk.cursorTheme.package = pkgs.bibata-cursors;
  gtk.cursorTheme.name = "Bibata-Modern-Ice";

  gtk.theme.package = pkgs.gruvbox-gtk-theme;
  gtk.theme.name = "Gruvbox-Dark";

  # gtk.iconTheme.package = pkgs.colloid-icon-theme;
  # gtk.iconTheme.name = "colloid-icon-theme";

  qt.enable = true;
  qt.platformTheme.name = "gtk";
  qt.style.name = "adwaita-dark";

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };

  xdg.desktopEntries = {
    "kicad" = {
      name = "KiCad (xwayland)";
      exec = "env QT_QPA_PLATFORM=xwayland kicad";
      terminal = false;
      icon = "kicad";
      categories = [ "Development" "Electronics" ];
    };
  };

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/travis/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = { EDITOR = "nvim"; };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
