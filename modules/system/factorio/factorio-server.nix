{ lib, config, pkgs, ... }:

{
  options = {
    factorio-server.enable = lib.mkEnableOption "enable terraria server";
  };

  config = lib.mkIf config.factorio-server.enable {

    environment.systemPackages = with pkgs; [ factorio-headless ];
    services.factorio = {
      enable = true;
      lan = true;
      game-name = "crow";
      game-password = "egg123";
      openFirewall = true;
      

      # mods = let
      #   inherit (pkgs) lib;
      #   modDir = "/home/aphelios/.factorio/mods";
      #   modList = lib.pipe (builtins.readDir modDir) [
      #     (lib.filterAttrs (k: v: v == "regular"))
      #     (lib.mapAttrsToList (k: v: k))
      #     (builtins.filter (lib.hasSuffix ".zip"))
      #   ];
      #   modToDrv = modFileName:
      #     pkgs.runCommand "copy-factorio-mods" { } ''
      #       mkdir $out
      #       cp ${modDir + "/${modFileName}"} $out/${modFileName}
      #     '' // {
      #       deps = [ ];
      #     };
      # in builtins.map modToDrv modList;
    };

    # systemd.services.factorio = {
    #   description = "Factorio Server";
    #   after = [ "network.target" ];
    #
    #   serviceConfig = {
    #     WorkingDirectory = "/home/aphelios";
    #     ExecStart = "/run/current-system/sw/bin/docker compose up";
    #     ExecStop = "/run/current-system/sw/bin/docker compose down";
    #     Restart = "always";
    #   };
    # };
  };
}
