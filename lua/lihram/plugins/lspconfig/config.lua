local lsp = vim.lsp

-- Source: https://vi.stackexchange.com/questions/31748/how-to-set-the-diagnostic-level-for-neovim-lsp
-- Source 2: https://github.com/neovim/neovim/pull/13528
-- Hide diagnostics of severity "hint"
lsp.handlers["textDocument/publishDiagnostics"] = lsp.with(
    lsp.diagnostic.on_publish_diagnostics, {
        signs = {
            severity_limit = "Warning",
        },
        underline = {
            severity_limit = "Warning",
        },
    }
);

