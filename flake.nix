{
	description = "A very basic flake";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
	};

	outputs = { nixpkgs, ...  } @ inputs:
	let
		system = "x86_64-linux";
		pkgs = import nixpkgs { inherit system; config.allowUnfree = true; };

		mkSystem = host: nixpkgs.lib.nixosSystem {
			specialArgs = { inherit system; };

			inherit system;
			inherit pkgs;

			modules = [
				{
					networking.hostName = host;

					system.stateVersion = "24.11";
					nix.settings.experimental-features = [ "nix-command" "flakes" ];
				}

				./hardware-configuration.nix
				./modules/base.nix
				./modules/users.nix
				./modules/networking.nix
				./modules/services
			];
		};

		wrap = func: host: { ${host} = func host; };
		
	in 
	{
		nixosConfigurations = wrap mkSystem "nwbox";
 
		#packages.x86_64-linux.hello = nixpkgs.legacyPackages.x86_64-linux.hello;
		#packages.x86_64-linux.default = self.packages.x86_64-linux.hello;

	};
}
