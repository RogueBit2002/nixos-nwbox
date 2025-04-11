{ config, pkgs, ... }:

{
	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;

	time.timeZone = "Europe/Amsterdam";
	i18n.defaultLocale = "en_US.UTF-8";

	environment.systemPackages = with pkgs; [
		wget
		git
		ethtool
		pciutils
		dig
	];
}
