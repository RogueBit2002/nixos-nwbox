{ ... }:
{
	services.openssh = {
		enable = true;
		ports = [ 22 ];
		
		listenAddresses = [ { addr = "10.0.0.10"; } ];
	};
}
