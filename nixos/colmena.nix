{ nixpkgs, terraform-outputs, ... }:
let system = "x86_64-linux";
in {
  meta = {
    nixpkgs = import nixpkgs { inherit system; };
    description = "SantosLabs Infrastructure";
  };

  defaults = { config, ... }: {
    imports = [ ./modules ];

    _module.args = { inherit terraform-outputs; };

    deployment.replaceUnknownProfiles = true;

    system.stateVersion = "23.05";

    swapDevices = [{
      device = "/var/swapfile";
      size = 4096;
    }];

    services.logrotate.enable = true;
  };

  node1 = {
    deployment = {
      targetHost = terraform-outputs.node1_ipv4.value;
      tags = [ "hetzner" "nuremberg" ];
    };

    imports = [ ./hosts/node1 ];
  };
}
