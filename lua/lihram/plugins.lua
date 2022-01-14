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
	use "tjdevries/nlua.nvim"
	use "nvim-lua/completion-nvim"
	use { "glepnir/lspsaga.nvim", requires = { "neovim/nvim-lspconfig" } }
	use { "folke/trouble.nvim", requires = "kyazdani42/nvim-web-devicons", config = function() require("trouble").setup {} end }

	-- Autocompletion
	use {
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
		}
	}

	-- Telescope
	use "nvim-lua/popup.nvim"
	use "nvim-lua/plenary.nvim"
	use "nvim-telescope/telescope.nvim"
	use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
	use { "nvim-treesitter/nvim-treesitter", run = ':TSUpdate' }

	-- Telescope select
	use { "nvim-telescope/telescope-ui-select.nvim" }

	-- Comments
	use "tpope/vim-commentary"
end)
