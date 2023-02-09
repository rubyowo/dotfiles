{
  description = "Literal Garbage.";

  inputs = {
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
    nixpkgs-rubyowo.url = "github:rubyowo/nixpkgs/catppuccin-papirus-folders";

    nixpkgs.follows = "nixpkgs-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
    };

    rust-overlay.url = "github:oxalica/rust-overlay";
    hyprland.url = "github:hyprwm/Hyprland";
    hyprpaper.url = "github:hyprwm/hyprpaper";
    hyprpicker.url = "github:hyprwm/hyprpicker";

    nix-gaming.url = "github:fufexan/nix-gaming";

    catppuccin-toolbox.url = "github:catppuccin/toolbox";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    rust-overlay,
    hyprland,
    ...
  } @ inputs: let
    overlays = {pkgs, ...}: {
      nixpkgs.overlays = with inputs; [
        rust-overlay.overlays.default
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
        {
          environment.etc."nix/inputs/nixpkgs".source = nixpkgs.outPath;
          nix.nixPath = ["nixpkgs=/etc/nix/inputs/nixpkgs"];
          nix.registry.nixpkgs.flake = nixpkgs;
        }
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
