{
  description = "Antonio's Neovim configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
  };

  outputs = { nixpkgs, ... }: {
    homeManagerModules.default = import ./hm-module.nix;
  };
}