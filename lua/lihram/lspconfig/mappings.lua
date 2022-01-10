local nvim_lsp = require("lspconfig")
local buf = vim.lsp.buf
local diag = vim.lsp.diagnostic

local on_attach = function(client, bufnr)
	local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
	
	local opts = { noremap=true, silent=true }

	buf_set_keymap("n", "<leader>gg", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	buf_set_keymap("n", "<leader>gi", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	buf_set_keymap("n", "<leader>gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)

	buf_set_keymap("n", "<leader>gsh", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	buf_set_keymap("n", "<c-\\>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)

	buf_set_keymap("n", "<leader>grr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	buf_set_keymap("n", "<leader>grn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	buf_set_keymap("n", "<leader>gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	buf_set_keymap("n", "<leader>gca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	buf_set_keymap("n", "<leader>gdn", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
	buf_set_keymap("n", "<leader>gdp", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
	buf_set_keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

local servers =
	{ "rust_analyzer"
	, "omnisharp"
	, "yamlls"
	}

for _, lsp in ipairs(servers) do
	nvim_lsp[lsp].setup {
		on_attach = on_attach,
		flags = {
			debounce_text_changes = 150,
		}
	}
end
