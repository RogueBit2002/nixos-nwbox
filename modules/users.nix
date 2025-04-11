{ config, ... }:
{
	users.users.laurens = {
		isNormalUser = true;
		description = "Laurens";
		extraGroups = [ "networkmanager" "wheel" ];
	};
}
