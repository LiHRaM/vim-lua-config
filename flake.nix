{
  description = "LiHRaM's Neovim";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
  inputs.flake-utils.url = "github:numtide/flake-utils";
  inputs.neovim-overlay = {
    url = "github:nix-community/neovim-nightly-overlay";
    inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, neovim-overlay, flake-utils, ... }@inputs:
    flake-utils.lib.eachDefaultSystem (system:
    let
      src = ./.;
      pkgs = import nixpkgs {
        inherit system;
        overlays = [
          neovim-overlay.overlay
        ];
      };

      config = pkgs.neovimUtils.makeNeovimConfig {
        customRC = ''
          set runtimepath=${src},$VIMRUNTIME
          luafile ${src}/init.lua
        '';
      };
    in rec {
      apps.nvim = {
        type = "app";
        program = "${defaultPackage}/bin/nvim";
      };

      defaultApp = apps.nvim;
      defaultPackage = packages.neovim-lihram;

      devShell = pkgs.mkShell { buildInputs = [ packages.neovim-lihram ]; };

      overlay = self: super: rec {
        neovim-lihram = packages.neovim-lihram;
      };

      packages.neovim-lihram = pkgs.wrapNeovimUnstable pkgs.neovim-unwrapped config;
    }
  );
}

