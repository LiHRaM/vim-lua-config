local nnoremap = vim.keymap.nnoremap
local inoremap = vim.keymap.inoremap
local buf = vim.lsp.buf
local diag = vim.lsp.diagnostic

nnoremap { "<leader>gg", buf.definition }
nnoremap { "<leader>gi", buf.definition }
nnoremap { "<leader>gD", buf.declaration }

nnoremap { "<leader>gsh", require("lspsaga.signaturehelp").signature_help }
nnoremap { "<c-\\>", require("lspsaga.signaturehelp").signature_help }

nnoremap { "<leader>grr", buf.references }
nnoremap { "<leader>grn", buf.rename }
nnoremap { "<leader>gh", buf.hover }
nnoremap { "<leader>gca", buf.code_action }
nnoremap { "<leader>gdn", diag.goto_next }
nnoremap { "<leader>gdp", diag.goto_prev }
