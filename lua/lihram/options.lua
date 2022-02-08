vim.api.nvim_set_keymap("n", ",", "<NOP>", { noremap = true, silent = true })
vim.g.mapleader = ","

-- Basic options
vim.opt.number = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smarttab = true
vim.opt.ignorecase = true                               -- Ignore case letters when searching
vim.opt.smartcase = true                                -- Ignore lowercase for the whole pattern
vim.opt.clipboard = "unnamedplus"                       -- Use system clipboard for copy/paste
vim.opt.list = true                                     -- Show characters that are normally invisible
vim.opt.listchars = { tab = '▸ ', trail = '·' } -- »▶▸  -- Characters that indicate whitespace type
vim.opt.swapfile = false                                -- Disable swapfile
vim.opt.mouse = "a"                                     -- Enable mouse support

-- Diagnostics
vim.diagnostic.config {
    virtual_text = false,
    signs = false,
    underline = true,
    severity_sort = true,
    update_in_insert = true,
    float = {
        source = "always",
    },
}

-- Indentation
vim.api.nvim_set_keymap("v", "<", "<gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", ">", ">gv", { noremap = true, silent = true })

-- Move selected line in visual mode
vim.api.nvim_set_keymap("x", "<M-Up>", ":move '<-2<CR>gv-gv'", { noremap = true, silent = true })
vim.api.nvim_set_keymap("x", "<M-Down>", ":move '>+1<CR>gv-gv'", { noremap = true, silent = true })

-- Tab switches buffer
vim.api.nvim_set_keymap("n", "<TAB>", ":bnext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<S-TAB>", ":bprevious<CR>", { noremap = true, silent = true })

-- Close current buffer with <C-w>
vim.api.nvim_set_keymap("n", "<C-w>", ":bd<CR>", { noremap = true, silent = true })

-- Switch between splits
vim.api.nvim_set_keymap("n", "<A-Up>", ":wincmd k<CR>", { noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<A-Down>", ":wincmd j<CR>", { noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<A-Left>", ":wincmd h<CR>", { noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<A-Right>", ":wincmd l<CR>", { noremap = true, silent = true})
