# LiHRaM's Neovim Config

These are my lua config files for Neovim.

## Installation - Windows

Just clone to your %LOCALAPPDATA%/nvim/.

## Installation - Nix Flakes

Add the overlay to your system `flake.nix`.

```nix
{
  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  inputs.neovim-lihram.url = "github:LiHRaM/vim-lua-config";
  inputs.neovim-lihram.inputs.nixpkgs.follows = "nixpkgs";

  outputs = {self, nixpkgs, neovim-lihram, ... }@inputs:
  let
    system = "x86_64-linux";

    # Define `pkgs` as nixpkgs with neovim-lihram available.
    # You should now be able to add it where
    # you add your packages under the name neovim-lihram.
    pkgs = import nixpkgs {
      inherit system;
      overlays = [ neovim-lihram.overlay.${system} ];
    };
  in {
    # Use pkgs in here.
  }
}
```

The available systems can be seen by running `nix flake check github:LiHRaM/vim-lua-config`.
