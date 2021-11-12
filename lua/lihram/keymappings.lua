vim.api.nvim_set_keymap("n", ",", "<NOP>", { noremap = true, silent = true })
vim.g.mapleader = ","

-- Basic options
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.smarttab = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.clipboard = "unnamedplus"

-- Telescope
vim.api.nvim_set_keymap("n", "<Leader>ff", ":Telescope find_files<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>fg", ":Telescope live_grep<CR>", { noremap = true, silent = true })

-- Indentation
vim.api.nvim_set_keymap("v", "<", "<gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", ">", ">gv", { noremap = true, silent = true })

-- Tab switches buffer
vim.api.nvim_set_keymap("n", "<TAB>", ":bnext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<S-TAB>", ":bprevious<CR>", { noremap = true, silent = true })

-- Move selected line in visual mode
vim.api.nvim_set_keymap("x", "<M-Up>", ":move '<-2<CR>gv-gv'", { noremap = true, silent = true })
vim.api.nvim_set_keymap("x", "<M-Down>", ":move '>+1<CR>gv-gv'", { noremap = true, silent = true })

