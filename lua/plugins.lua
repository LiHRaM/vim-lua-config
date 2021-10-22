local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
  execute 'packadd packer.nvim'
end

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Themes
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'
  use 'tomasiser/vim-code-dark'
  
  -- LSP
  use "neovim/nvim-lspconfig"
  use "tjdevries/lsp_extensions.nvim"
  use "hrsh7th/nvim-compe"
  use "hrsh7th/vim-vsnip"
  use "hrsh7th/vim-vsnip-integ"
  use { "glepnir/lspsaga.nvim", requires = { "neovim/nvim-lspconfig" } }
  use "lithammer/nvim-pylance"

  -- Telescope
  use "nvim-lua/popup.nvim"
  use "nvim-lua/plenary.nvim"
  use "nvim-telescope/telescope.nvim"
  use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
  use { "nvim-treesitter/nvim-treesitter", run = ':TSUpdate' }

  -- Comments
  use "tpope/vim-commentary"
end)
