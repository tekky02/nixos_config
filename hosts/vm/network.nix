let
  hostname = "nixos-vm1";
  interface = "ens18";
  ipv4 = "192.168.50.31";
  gateway = "192.168.50.1";
in
{
  networking = {
    dhcpcd.enable = false;
    hostName = hostname;
    firewall.enable = false;
    interfaces.${interface} = {
      ipv4.addresses = [
        {
          address = ipv4;
          prefixLength = 24;
        }
      ];
    };
    defaultGateway = {
      address = gateway;
      interface = interface;
    };

    nameservers = [
      "192.168.50.1"
      "8.8.8.8"
    ];
  };
}
