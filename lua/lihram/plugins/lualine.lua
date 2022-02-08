function buffer_lsp()
  msg = "No active LSP"
  local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
  local clients = vim.lsp.get_active_clients()

  for _, client in ipairs(clients) do
    local filetypes = client.config.filetypes
    if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
      return client.name
    end
  end

  return msg
end

require("lualine").setup {
  options = {
    icons_enabled = false,
    theme = "auto",
    component_separators = { left = "", right = ""},
    section_separators = { left = "", right = ""},
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  tabline = {
    lualine_a = {"buffers"},
    lualine_b = {"encoding"},
    lualine_c = {},
    lualine_x = {buffer_lsp},
    lualine_y = {"filetype"},
    lualine_z = {"tabs"},
  },
  sections = {
    lualine_a = {"branch"},
    lualine_b = {"diff"},
    lualine_c = {"diagnostics"},
    lualine_x = {"fileformat"},
    lualine_y = {"progress"},
    lualine_z = {"location"},
  },
  inactive_sections = {},
  extensions = {}
}
