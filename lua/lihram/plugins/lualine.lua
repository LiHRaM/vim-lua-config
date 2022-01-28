require("lualine").setup {
  options = {
    icons_enabled = true,
    theme = "auto",
    component_separators = { left = "", right = ""},
    section_separators = { left = "", right = ""},
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  tabline = {
    lualine_a = {"buffers"},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {"require'lsp-status'.status()"},
    lualine_y = {"filetype"},
    lualine_z = {"tabs"},
  },
  sections = {
    lualine_a = {"branch"},
    lualine_b = {"diff"},
    lualine_c = {"diagnostics"},
    lualine_x = {"encoding", "fileformat"},
    lualine_y = {"progress"},
    lualine_z = {"location"},
  },
  inactive_sections = {},
  extensions = {}
}
