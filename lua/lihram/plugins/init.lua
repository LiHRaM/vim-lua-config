local M = {}

local vim_code_dark_config = function() vim.cmd [[colorscheme codedark]] end
local trouble_config = function() require("lihram.plugins.trouble") end
local nvim_dap_config = function() require("lihram.plugins.nvim-dap") end
local lualine_config = function() require("lihram.plugins.lualine") end
local treesitter_config = function() require("lihram.plugins.treesitter") end
local telescope_config = function() require("lihram.plugins.telescope") end
local nvim_cmp_config = function() require("lihram.plugins.nvim-cmp") end

M.setup_no_packer = function()
  vim_code_dark_config()
  trouble_config()
  nvim_dap_config()
  lualine_config()
  treesitter_config()
  telescope_config()
  nvim_cmp_config()
end

M.setup_with_packer = function()
    local execute = vim.api.nvim_command
    local fn = vim.fn

    -- Bootstrap Packer on new machines
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    end

    require('packer').startup(function(use)
        -- Packer can manage itself
        use 'wbthomason/packer.nvim'

        -- Themes
        use {
            'tomasiser/vim-code-dark',
            config = vim_code_dark_config,
        }

        -- LSP
        use { "neovim/nvim-lspconfig", config = function() require("lihram.plugins.lspconfig") end }
        use "tjdevries/lsp_extensions.nvim"
        use "nvim-lua/completion-nvim"
        use {
            "glepnir/lspsaga.nvim",
            requires = { "neovim/nvim-lspconfig" }
        }
        use {
            "folke/trouble.nvim",
            requires = "kyazdani42/nvim-web-devicons",
            config = trouble_config,
        }

        -- DAP
        use {
            "mfussenegger/nvim-dap",
            requires = {
                {"jbyuki/one-small-step-for-vimkind"}, -- Neovim Lua
            },
            config = nvim_dap_config,
        }

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
            },
            config = nvim_cmp_config,
        }

        -- Telescope
        use "nvim-lua/popup.nvim"
        use "nvim-lua/plenary.nvim"
        use {
            "nvim-telescope/telescope.nvim",
            config = telescope_config,
        }
        use { 
            "nvim-telescope/telescope-fzf-native.nvim", 
            run = "make" 
        }
        use {
            "nvim-treesitter/nvim-treesitter", 
            config = treesitter_config,
            run = ':TSUpdate'
        }

        -- Telescope select
        use { "nvim-telescope/telescope-ui-select.nvim" }

        -- Comments
        use "tpope/vim-commentary"

        -- Base64
        use "taybart/b64.nvim"

        -- Statusline
        use {
            "nvim-lualine/lualine.nvim",
            requires = {
                {"kyazdani42/nvim-web-devicons", opt = true},
            },
            config = lualine_config,
        }

        -- Navigation help
        use {
            "sudormrfbin/cheatsheet.nvim",
            requires = {
                {"nvim-telescope/telescope.nvim"},
                {"nvim-lua/popup.nvim"},
                {"nvim-lua/plenary.nvim"},
            }
        }

        if packer_bootstrap then
            require("packer").sync()
        end
    end)
end

return M
