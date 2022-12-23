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
    hyprland.url = "github:hyprwm/Hyprland";
    xdg-portal-hyprland.url = "github:hyprwm/xdg-desktop-portal-hyprland";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    fenix,
    hyprland,
    ...
  } @ inputs: let
    filterNixFiles = k: v: v == "regular" && nixpkgs.lib.hasSuffix ".nix" k;

    importNixFiles = path:
      with nixpkgs.lib;
        (lists.forEach (mapAttrsToList (name: _: path + ("/" + name))
            (filterAttrs filterNixFiles (builtins.readDir path))))
        import;

    overlays = {pkgs, ...}: {
      nixpkgs.overlays = with inputs;
        [
          (final: _: let
            inherit (final) system;
          in {
            rubyowo = import nixpkgs-rubyowo {inherit config system;};
          })

          fenix.overlays.default
        ]
        ++ (importNixFiles ./overlays);
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
          home-manager.extraSpecialArgs = {inherit system inputs;};
        }
        overlays
        hyprland.nixosModules.default
        {programs.hyprland.enable = true;}
      ];
    };
  };
}
