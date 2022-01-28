local pluginsDir = "lihram.plugins"

vim.cmd [[
colorscheme codedark
]]

require(pluginsDir .. ".lspconfig")
require(pluginsDir .. ".trouble")
require(pluginsDir .. ".nvim-dap")
require(pluginsDir .. ".nvim-cmp")
require(pluginsDir .. ".telescope")
require(pluginsDir .. ".treesitter")
require(pluginsDir .. ".lualine")
