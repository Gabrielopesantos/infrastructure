{ ... }: {
  imports = [ ./hardware-configuration.nix ];

  networking.hostName = "node1";
  systemd.network.networks = {
    "10-wan".matchConfig.MACAddress = "96:00:02:1f:07:ec";
    "10-network1".matchConfig.MACAddress = "86:00:00:43:8c:62";
  };
  services.grafana.enable = true;
}
