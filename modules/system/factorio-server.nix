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
      openFirewall = true;

      saveName = "lefactory";

      admins = [
        "travmonkey14"
        "Zurpie"
      ];

      mods = let
        inherit (pkgs) lib;
        modDir = /home/aphelios/.factorio/mods;
        modList = lib.pipe modDir [
          builtins.readDir
          (lib.filterAttrs (k: v: v == "regular"))
          (lib.mapAttrsToList (k: v: k))
          (builtins.filter (lib.hasSuffix ".zip"))
        ];
        modToDrv = modFileName:
          pkgs.runCommand "copy-factorio-mods" { } ''
            mkdir $out
            cp ${modDir + "/${modFileName}"} $out/${modFileName}
          '' // {
            deps = [ ];
          };
      in builtins.map modToDrv modList;
    };
  };
}
