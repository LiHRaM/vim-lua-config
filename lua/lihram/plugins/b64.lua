vim.api.nvim_set_keymap("v", "<Leader>be", ":<c-u>lua require('b64').encode()<CR>", { noremap = true, silent = true, })
vim.api.nvim_set_keymap("v", "<Leader>bd", ":<c-u>lua require('b64').decode()<CR>", { noremap = true, silent = true, })
