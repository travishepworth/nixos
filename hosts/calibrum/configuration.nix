# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ pkgs, inputs, ... }:

{
  imports = [ # Include the results of the hardware scan.
    ../../modules/system/default.nix
    ./hardware-configuration.nix
    ./drives.nix
    inputs.home-manager.nixosModules.default
  ];

  hyprland.enable = true;
  gaming.enable = true;
  terraria-server.enable = false;
  factorio-server.enable = false;

  nixpkgs.config.allowUnfree = true;
  # nixpkgs.config.allowUnfreePredicate = _: true;

  # nix = {
  #   package = pkgs.nixFlakes;
  #   extraOptions = ''
  #     experimental-features = nix-command flakes
  #   '';
  # };

  nix.settings.experimental-features = [ "nix-command flakes" ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  # Pre load graphics drivers
  boot.initrd.kernelModules = [ "amdgpu" ];

  # luks
  boot.initrd.luks.devices = {
    crypted = {
      device = "/dev/disk/by-uuid/944855ab-af98-457b-8ad7-b38f1d58a168";
      preLVM = true;
    };
  };

  boot.kernelParams = [
    "processor.max_cstate=4"
    "amd_iomu=soft"
    "idle=nomwait"
    "intel_pstate=disable"
  ];
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # nix.settings = {
  #   substituters = [ "https://hyprland.cachix.org" ];
  #   trusted-public-keys =
  #     [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
  # };

  hardware.pulseaudio.enable = false;

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;

    wireplumber = { enable = true; };
  };

  fonts.packages = with pkgs; [ 
    nerd-fonts.noto
    nerd-fonts.hack
    nerd-fonts.victor-mono
    nerd-fonts.monofur
    noto-fonts-emoji ];

  networking.hostName = "calibrum"; # Define your hostname.
  networking.networkmanager.enable =
    true; # Easiest to use and most distros use this by default.

  # Set your time zone.
  time.timeZone = "America/Denver";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable RGB control
  # services.hardware.openrgb.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.travis = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
      "audio"
      "video"
      "input"
      "docker"
    ]; # Enable ‘sudo’ for the user.
    shell = pkgs.zsh;
  };

  home-manager = {
    # also pass inputs to home-manager modules
    extraSpecialArgs = { inherit inputs; };
    users = { "travis" = import ./home.nix; };
  };

  # Setting up steam and graphics drivers
  # hardware.graphics.enable = true;
  # services.xserver.enable = true;
  # services.xserver.videoDrivers = [ "amdgpu" ];
  #
  # hardware.graphics.extraPackages = with pkgs; [
  #   rocm-opencl-icd
  #   rocm-opencl-runtime
  #   mesa.drivers
  # ];

  # programs.steam = {
  #   enable = true;
  #   remotePlay.openFirewall =
  #     true; # Open ports in the firewall for Steam Remote Play
  #   dedicatedServer.openFirewall =
  #     true; # Open ports in the firewall for Source Dedicated Server
  #   localNetworkGameTransfers.openFirewall =
  #     true; # Open ports in the firewall for Steam Local Network Game Transfers
  #   gamescopeSession.enable = true;
  # };

  programs.zsh.enable = true;
  programs.dconf.enable = true;
  services.gnome.at-spi2-core.enable = true;

  services.xserver.displayManager.lightdm.enable = false;

  services.displayManager.sddm = {
    enable = false;
    # theme = "${import ./sddm-theme.nix { inherit pkgs; }}";
    theme = "catppuccin-mocha";
  };

  # stylix.enable = true;
  home-manager.backupFileExtension = "backup";
  # stylix.image = pkgs.fetchurl {
  #     url = "https://www.pixelstalk.net/wp-content/uploads/2016/05/Epic-Anime-Awesome-Wallpapers.jpg";
  #     sha256 = "enQo3wqhgf0FEPHj2coOCvo7DuZv+x5rL/WIo4qPI50=";
  #   };
  # stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";

  services.zerotierone.enable = true;

  environment.sessionVariables = { FLAKE = "/home/travis/nixos"; };

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 7d --keep 3";
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # necessary
    git
    curl
    wget
    nh

    # c/c++
    gcc
    gcc-arm-embedded
    libgcc
    libcxx
    binutils
    gnumake
    cmake
    extra-cmake-modules
    glxinfo

    go

    # wine
    wine
    winetricks
    protontricks

    # compressing/extracting
    rar
    gnutar
    unzip

    # gtk / qt 
    gtk3
    gtk2
    nwg-look
    libsForQt5.qt5ct

    # audio control
    pavucontrol
    easyeffects
    myxer

    # fetchers
    fastfetch
    uwufetch
    owofetch

    # network
    protonvpn-gui
    zerotierone

    # login managers
    catppuccin-sddm
    sddm

    # development
    python3
    nodejs_22
    # dotnetCorePackages.sdk_9_0
    # steamcmd
    mono

    ddcutil

    # editors
    neovim
    vim
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  system.stateVersion = "24.05"; # Did you read the comment?
}

