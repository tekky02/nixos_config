{
  description = "tekky's nixos configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";

    };

    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:tekky02/nixvim";
      # url = "git+file:///home/tekky/workspace/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    lazyvim = {
      url = "github:matadaniel/LazyVim-module";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    LazyVim = {
      url = "github:tekky02/lazyvim_config";
      flake = false;
    };

    grub2-themes = {
      url = "github:vinceliuice/grub2-themes";
    };

    # nur.url = "github:nix-community/NUR";
    # nix-gaming.url = "github:fufexan/nix-gaming";

    # nix-flatpak.url = "github:gmodena/nix-flatpak";

    # zen-browser.url = "github:0xc000022070/zen-browser-flake";

    # ghostty.url = "github:ghostty-org/ghostty";

    # superfile.url = "github:yorukot/superfile";
  };

  outputs =
    { nixpkgs, self, ... }@inputs:
    let
      username = "tekky";
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      lib = nixpkgs.lib;
    in
    {
      nixosConfigurations = {
        desktop = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            ./hosts/desktop
            inputs.grub2-themes.nixosModules.default
          ];
          specialArgs = {
            host = "desktop";
            inherit
              self
              inputs
              username
              system
              ;
          };
        };
        laptop = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            ./hosts/laptop
            inputs.grub2-themes.nixosModules.default
          ];
          specialArgs = {
            host = "laptop";
            inherit
              self
              inputs
              username
              system
              ;
          };
        };
        vm = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [ ./hosts/vm ];
          specialArgs = {
            host = "vm";
            inherit self inputs username;
          };
        };
      };
    };
}
