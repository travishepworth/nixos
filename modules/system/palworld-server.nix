{ lib, config, pkgs, ... }:

{
  options = {
    palworld-server.enable = lib.mkEnableOption "enable palworld server";
  };

  # variable to store home username for absolute paths

  config = lib.mkIf config.palworld-server.enable {

    systemd.services.palworld = {
      description = "Palworld Server";
      after = [ "network.target" ];
      wantedBy = [ "multi-user.target" ];

      serviceConfig = {
        WorkingDirectory =
          "/home/aphelios/.steam/steam/Steamapps/common/PalServer";
        ExecStart =
          "${pkgs.bash}/bin/bash /home/aphelios/.steam/steam/Steamapps/common/PalServer/PalServer.sh";
        Restart = "always";
        User = "aphelios";
      };
    };
  };
}
