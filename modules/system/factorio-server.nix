{ lib, config, pkgs, ... }:

{
  options = {
    factorio-server.enable = lib.mkEnableOption "enable terraria server";
  };

  config = lib.mkIf config.factorio-server.enable {

    environment.systemPackages = with pkgs; [ factorio-headless ];

    systemd.services.tml = {
      description = "Factorio Server";
      after = [ "network.target" ];

      serviceConfig = {
        WorkingDirectory = "/home/aphelios";
        ExecStart = "/run/current-system/sw/bin/docker compose up";
        ExecStop = "/run/current-system/sw/bin/docker compose down";
        Restart = "always";
      };
    };
  };
}
