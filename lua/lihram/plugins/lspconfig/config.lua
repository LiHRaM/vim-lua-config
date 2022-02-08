local lsp = vim.lsp

lsp.handlers["textDocument/signatureHelp"] = lsp.with(
  lsp.handlers.signature_help,
  { border = "single" }
)

-- Source: https://vi.stackexchange.com/questions/31748/how-to-set-the-diagnostic-level-for-neovim-lsp
-- Hide diagnostics of severity "hint"
lsp.handlers["textDocument/publishDiagnostics"] = lsp.with(
    lsp.diagnostic.on_publish_diagnostics, {
        signs = {
            severity_limit = "Warning",
        },
    }
);
