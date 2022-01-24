# LiHRaM's Neovim Config

These are my lua config files for Neovim.

## Installation - Windows

Just clone to your %LOCALAPPDATA%/nvim/.

## Installation - Nix Flakes

Add the overlay for your system, e.g.

```nix
nixpkgs.overlays = [ neovim-lihram.overlay.x86-64-linux ];
```

The available systems can be seen by running `nix flake check github:LiHRaM/vim-lua-config`.
