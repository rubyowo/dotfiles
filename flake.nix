{
  description = "Literal Garbage.";

  inputs = {
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
    nixpkgs-rubyowo.url = "github:rubyowo/nixpkgs/catppuccin-papirus-folders";

    nixpkgs.follows = "nixpkgs-rubyowo";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    fenix = {
      url = "github:nix-community/fenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland-contrib.url = "github:hyprwm/contrib";
    hyprpicker.url = "github:hyprwm/hyprpicker";

    nix-gaming = {
      url = "github:fufexan/nix-gaming";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    webcord.url = "github:fufexan/webcord-flake";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    fenix,
    hyprland,
    webcord,
    ...
  } @ inputs: let
    overlays = {pkgs, ...}: {
      nixpkgs.overlays = with inputs;
        [
          (final: _: let
            inherit (final) system;
          in {
            rubyowo = import nixpkgs-rubyowo {inherit config system;};
          })
          fenix.overlays.default
          webcord.overlays.default
        ];
    };

    config = {
      allowBroken = true;
      allowUnfree = true;
      tarball-ttl = 0;
    };
    system = "x86_64-linux";
  in {
    nixosConfigurations.selene = nixpkgs.lib.nixosSystem {
      inherit system;
      modules = [
        ./hosts/selene
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
        }
        overlays
        hyprland.nixosModules.default
        {programs.hyprland.enable = true;}
      ];
      specialArgs = {inherit system inputs;};
    };
  };
}
