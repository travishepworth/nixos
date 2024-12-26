# Main configuration for server machine
{ pkgs, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.default
    ../../modules/system/default.nix
  ];

  networking.firewall.allowedTCPPorts = [ 8211 ];
  networking.firewall.allowedUDPPorts = [ 8211 ];

  hyprland.enable = false;
  gaming.enable = false;
  terraria-server.enable = true;
  factorio-server.enable = true;
  palworld-server.enable = true;

  nixpkgs.config.allowUnfree = true;

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs;
    [
      glibc
      gcc
    ];

  # nix = {
  #   package = pkgs.nixVersions.stable;
  #   extraOptions = ''
  #     experimental-features = nix-command flakes
  #   '';
  # };

  nix.settings.experimental-features = [ "nix-command flakes" ];

  users.users.aphelios = {
    isNormalUser = true;
    description = "aphelios";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    shell = pkgs.zsh;
  };

  # Bootloader.
  boot.loader.systemd-boot.enable = true;

  networking.hostName = "severum"; # Define your hostname.
  networking.networkmanager.enable =
    true; # Easiest to use and most distros use this by default.

  environment.sessionVariables = { FLAKE = "/home/aphelios/nixos"; };

  # Enable ssh
  services.openssh.enable = true;

  programs.zsh.enable = true;

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 7d --keep 3";
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = { "aphelios" = import ./home.nix; };
    backupFileExtension = "backup";
  };

  services.zerotierone.enable = true;
  security.sudo.wheelNeedsPassword = false;

  environment.systemPackages = with pkgs; [
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
    zerotierone

    nh
    vim
    neovim
    git
    wget
    curl
    btop
    steamcmd
  ];

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  system.stateVersion = "24.05";
}
