local telescope = require("telescope")

telescope.setup {
  pickers = {
      find_files = {
          theme = "dropdown",
      },
  },
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown(),
    },
  },
}

telescope.load_extension("fzy_native")
telescope.load_extension("ui-select")

local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap("n", "<Leader>ff", ":Telescope find_files<CR>", opts)
vim.api.nvim_set_keymap("n", "<Leader>fb", ":Telescope buffers<CR>", opts)
vim.api.nvim_set_keymap("n", "<Leader>fgb", ":Telescope git_branches<CR>", opts)
vim.api.nvim_set_keymap("n", "<Leader>fgc", ":Telescope git_commits<CR>", opts)

