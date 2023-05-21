{
  description = "Home Manager configuration of rodolphe";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixneovimplugins.url = "github:jooooscha/nixpkgs-vim-extra-plugins";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @  { self, nixpkgs, home-manager,  ... }:
    let
      system = "x86_64-linux";
    in {
      homeConfigurations."rodolphe" = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
	        inherit system;
		overlays = [
  		    inputs.nixneovimplugins.overlays.default
		];
	        config.allowUnfree = true;
	    };
        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [ ./home.nix ];

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
      };
    };
}
