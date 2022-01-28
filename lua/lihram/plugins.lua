local execute = vim.api.nvim_command
local fn = vim.fn

-- Bootstrap Packer on new machines
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

-- Run PackerCompile on save.
vim.cmd([[
	augroup packer_user_config
		autocmd!
		autocmd BufWritePost plugins.lua source <afile> | PackerCompile
	augroup end
]])

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

    -- Navigation help
    use {
      "sudormrfbin/cheatsheet.nvim",
      requires = {
        {"nvim-telescope/telescope.nvim"},
        {"nvim-lua/popup.nvim"},
        {"nvim-lua/plenary.nvim"},
      }
    }

	-- Themes
	use 'vim-airline/vim-airline'
	use 'vim-airline/vim-airline-themes'
	use 'tomasiser/vim-code-dark'

	-- LSP
	use "neovim/nvim-lspconfig"
	use "tjdevries/lsp_extensions.nvim"
	use "nvim-lua/completion-nvim"
	use { "glepnir/lspsaga.nvim", requires = { "neovim/nvim-lspconfig" } }
	use { "folke/trouble.nvim", requires = "kyazdani42/nvim-web-devicons", config = function() require("trouble").setup {} end }

	-- Lua
	use "tjdevries/nlua.nvim"

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

	-- Base64
	use "taybart/b64.nvim"

	if packer_bootstrap then
		require("packer").sync()
	end
end)
