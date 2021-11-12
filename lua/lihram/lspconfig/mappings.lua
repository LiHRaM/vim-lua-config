local nvim_lsp = require("lspconfig")
local buf = vim.lsp.buf
local diag = vim.lsp.diagnostic

local on_attach = function(client, bufnr)
	local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
	
	local opts = { noremap=true, silent=true }

	buf_set_keymap("n", "<leader>gg", buf.definition, opts)
	buf_set_keymap("n", "<leader>gi", buf.definition, opts)
	buf_set_keymap("n", "<leader>gD", buf.declaration, opts)

	buf_set_keymap("n", "<leader>gsh", require("lspsaga.signaturehelp").signature_help, opts)
	buf_set_keymap("n", "<c-\\>", require("lspsaga.signaturehelp").signature_help, opts)

	buf_set_keymap("n", "<leader>grr", buf.references, opts)
	buf_set_keymap("n", "<leader>grn", buf.rename, opts)
	buf_set_keymap("n", "<leader>gh", buf.hover, opts)
	buf_set_keymap("n", "<leader>gca", buf.code_action, opts)
	buf_set_keymap("n", "<leader>gdn", diag.goto_next, opts)
	buf_set_keymap("n", "<leader>gdp", diag.goto_prev, opts)
end

local servers = { "rust_analyzer" }

for _, lsp in ipairs(servers) do
	nvim_lsp[lsp].setup {
		on_attach = on_attach,
		flags = {
			debounce_text_changes = 150,
		}
	}
end

