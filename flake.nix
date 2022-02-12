{
  description = "LiHRaM's Neovim";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    neovim-overlay = {
      url = "github:nix-community/neovim-nightly-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Plugins
    "nvim-plugin:packer.nvim" = {
      url = "github:wbthomason/packer.nvim";
      flake = false;
    };
  };

  outputs = { self, nixpkgs, neovim-overlay, flake-utils, ... }@inputs:
    flake-utils.lib.eachDefaultSystem (system:
    let
      # Plugins
      separator = "nvim-plugin:";
      lib = import ./lib { inherit pkgs inputs separator; };
      pluginOverlay = lib.buildPluginOverlay;
      plugins = lib.plugins;

      src = ./.;
      pkgs = import nixpkgs {
        inherit system;
        overlays = [
          pluginOverlay
          neovim-overlay.overlay
        ];
      };

      config = pkgs.neovimUtils.makeNeovimConfig {
        customRC = ''
          set runtimepath=${src},$VIMRUNTIME
          lua << EOF
            require("lihram").setup_with_packer()
          EOF
        '';

          plugins = builtins.map (name: { plugin = name; }) plugins.names;
      };
    in rec {
      apps.nvim = {
        type = "app";
        program = "${defaultPackage}/bin/nvim";
      };

      defaultApp = apps.nvim;
      defaultPackage = packages.neovim-lihram;

      devShell = pkgs.mkShell { buildInputs = with pkgs; [
        packages.neovim-lihram
        rnix-lsp
        sumneko-lua-language-server
    ]; };

      overlay = self: super: rec {
        neovim-lihram = packages.neovim-lihram;
        neovimPlugins = pkgs.neovimPlugins;
      };

      packages.neovim-lihram = pkgs.wrapNeovimUnstable pkgs.neovim-unwrapped config;
    }
  );
}

