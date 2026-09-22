local util = require("config.keymaps.util")
local map = util.map
local desc = util.desc

-- Navigation
map("n", "gD", vim.lsp.buf.declaration, desc("Go to declaration"))
map("n", "gd", "<cmd>Lspsaga goto_definition<CR>", desc("Go to definition"))
map("n", "gp", "<cmd>Lspsaga peek_definition<CR>", desc("Peek definition"))
map("n", "gt", "<cmd>Lspsaga peek_type_definition<CR>", desc("Peek type definition"))
map("n", "gf", "<cmd>Lspsaga finder<CR>", desc("Find references & implementations"))
map("n", "gR", function()
	Snacks.picker.lsp_references()
end, desc("List references (picker)"))
map("n", "gi", function()
	Snacks.picker.lsp_implementations()
end, desc("List implementations (picker)"))

-- Actions
map("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", desc("Code actions"))
map("n", "<leader>rn", vim.lsp.buf.rename, desc("Rename symbol"))
map("n", "<leader>rs", ":LspRestart<CR>", desc("Restart LSP"))
map("n", "<leader>rc", "<cmd>CompletionReset<CR>", desc("Reset completion (blink + autopairs + LSP)"))
map("n", "K", "<cmd>Lspsaga hover_doc<CR>", desc("Hover documentation"))

-- Diagnostics
map("n", "<leader>d", vim.diagnostic.open_float, desc("Show line diagnostics"))
map("n", "<leader>D", function()
	Snacks.picker.diagnostics_buffer()
end, desc("List buffer diagnostics"))
map("n", "<leader>pd", "<cmd>Lspsaga show_workspace_diagnostics<CR>", desc("List workspace diagnostics"))
map("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", desc("Next diagnostic"))
map("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", desc("Previous diagnostic"))
map("n", "]D", function()
	require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
end, desc("Next error"))
map("n", "[D", function()
	require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, desc("Previous error"))

-- Word navigation (LSP references under cursor)
map("n", "]]", function()
	Snacks.words.jump(vim.v.count1)
end, desc("Next word reference"))
map("n", "[[", function()
	Snacks.words.jump(-vim.v.count1)
end, desc("Previous word reference"))
