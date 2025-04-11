{ config, ... }:

{
	networking = {
		networkmanager.enable = true;
		
		interfaces.enp1s0f0.ipv4.addresses = [{
			address = "10.0.0.10";
			prefixLength = 24;
		}];

		defaultGateway = "10.0.0.1";
		nameservers = [ "8.8.8.8" "8.8.4.4" ];
	};
}
