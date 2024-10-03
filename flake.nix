{
  description = "nvim config based on AstroNvim";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {flake-utils, ...}:
    flake-utils.lib.eachDefaultSystem (
      system: {
        homeManagerModules = import ./nix/modules/home-manager.nix;
      }
    );
}
