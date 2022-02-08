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
    "nvim-plugin:nvim-web-devicons" = {
      url = "github:kyazdani42/nvim-web-devicons";
      flake = false;
    };
    "nvim-plugin:nvim-treesitter" = {
      url = "github:nvim-treesitter/nvim-treesitter";
      flake = false;
    };
    "nvim-plugin:nvim-lspconfig" = {
      url = "github:neovim/nvim-lspconfig";
      flake = false;
    };
    "nvim-plugin:lsp-extensions" = {
      url = "github:tjdevries/lsp_extensions.nvim";
      flake = false;
    };
    "nvim-plugin:nvim-dap" = {
      url = "github:mfussenegger/nvim-dap";
      flake = false;
    };
    "nvim-plugin:plenary.nvim" = {
      url = "github:nvim-lua/plenary.nvim";
      flake = false;
    };
    "nvim-plugin:nvim-cmp" = {
      url = "github:hrsh7th/nvim-cmp";
      flake = false;
    };
    "nvim-plugin:telescope.nvim" = {
      url = "github:nvim-telescope/telescope.nvim";
      flake = false;
    };
    "nvim-plugin:telescope-fzf-native.nvim" = {
      url = "github:nvim-telescope/telescope-fzf-native.nvim";
      flake = false;
    };
    "nvim-plugin:telescope-ui-select.nvim" = {
      url = "github:nvim-telescope/telescope-fzf-native.nvim";
      flake = false;
    };
    "nvim-plugin:popup.nvim" = {
      url = "github:nvim-lua/popup.nvim";
      flake = false;
    };
    "nvim-plugin:editorconfig-vim" = {
      url = "github:editorconfig/editorconfig-vim";
      flake = false;
    };
    "nvim-plugin:null-ls.nvim" = {
      url = "github:jose-elias-alvarez/null-ls.nvim";
      flake = false;
    };
    "nvim-plugin:lualine.nvim" = {
      url = "github:nvim-lualine/lualine.nvim";
      flake = false;
    };
    "nvim-plugin:vim-code-dark" = {
      url = "github:tomasiser/vim-code-dark";
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
            require("lihram").setup_no_packer()
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

