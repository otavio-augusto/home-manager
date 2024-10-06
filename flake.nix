{
  description = "Home Manager configuration of souza";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nvchad4nix = {
      url = "github:nix-community/nix4nvchad";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    nix-colors.url = "github:misterio77/nix-colors";
  };

    outputs = { nixpkgs, home-manager, nvchad4nix, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      devShells.x86_64-linux.default = (import ./shell.nix {inherit pkgs;});
      homeConfigurations."souza" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

	      extraSpecialArgs = { inherit inputs; };

        # Specify your home configuration modules here, for example,
        # the path to your home.nix:
        modules = [ 
          #inherit specialArgs;
          ./home.nix
          {
            nixpkgs = {
              overlays = [
                (final: prev: {
                    nvchad = inputs.nvchad4nix.packages."${pkgs.system}".nvchad;
                })
              ];
            };
          }
         ];

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
      };
    };

}
