local lspconfig = require("lspconfig")
local lsp = vim.lsp

lspconfig.pyright.setup{}
lspconfig.rust_analyzer.setup{}
lspconfig.bashls.setup{}

lsp.handlers["textDocument/hover"] = lsp.with(
  require("lspsaga.hover").handler,
  { border = "single" }
)

lsp.handlers["textDocument/signatureHelp"] = lsp.with(
  lsp.handlers.signature_help,
  { border = "single" }
)
