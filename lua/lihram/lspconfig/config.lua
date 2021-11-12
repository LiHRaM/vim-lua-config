local lsp = vim.lsp

lsp.handlers["textDocument/hover"] = lsp.with(
  require("lspsaga.hover").handler,
  { border = "single" }
)

lsp.handlers["textDocument/signatureHelp"] = lsp.with(
  lsp.handlers.signature_help,
  { border = "single" }
)
