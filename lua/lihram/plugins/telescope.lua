-- This is your opts table
require("telescope").setup {
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {
        -- even more opts
      }
    }
  }
}
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require("telescope").load_extension("ui-select")

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<Leader>ff", ":Telescope find_files<CR>", opts)
vim.api.nvim_set_keymap("n", "<Leader>fb", ":Telescope buffers<CR>", opts)
vim.api.nvim_set_keymap("n", "<Leader>fgb", ":Telescope git_branches<CR>", opts)
vim.api.nvim_set_keymap("n", "<Leader>fgc", ":Telescope git_commits<CR>", opts)

