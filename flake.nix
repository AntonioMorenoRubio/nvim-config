{
  description = "Antonio's Neovim configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
  };

  outputs = { nixpkgs, ... }: {
    homeManagerModules.default = import ./hm-module.nix;
  };
}