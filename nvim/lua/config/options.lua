local global = {
	mapleader = " ",
	maplocalleader = " ",
}

for k, v in pairs(global) do
	vim.g[k] = v
end

local opts = {
	backup = false,
	clipboard = "unnamedplus",
	cmdheight = 0,
	completeopt = { "menuone", "noselect", "menu" },
	conceallevel = 0,
	fileencoding = "utf-8",
	hlsearch = true,
	ignorecase = true,
	mouse = "a",
	pumheight = 10,
	showmode = false,
	showtabline = 1,
	smartcase = true,
	smartindent = true,
	splitbelow = true,
	splitright = true,
	swapfile = false,
	termguicolors = true,
	timeoutlen = 1000,
	undofile = true,
	updatetime = 300,
	writebackup = false,
	expandtab = true,
	shiftwidth = 2,
	tabstop = 2,
	cursorline = true,
	number = true,
	relativenumber = true,
	numberwidth = 2,
	signcolumn = "yes",
	wrap = true,
	scrolloff = 10,
	list = true,
	listchars = { tab = "» ", trail = "·", nbsp = "␣" },
}

for k, v in pairs(opts) do
	vim.opt[k] = v
end

-- Set formatoptions separately to avoid concatenation issues
vim.opt.formatoptions:append("orj")

-- Global border style for all floating windows
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
vim.lsp.handlers["textDocument/signatureHelp"] =
	vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

vim.diagnostic.config({
	float = { border = "rounded" },
	signs = vim.g.have_nerd_font and {
		text = {
			[vim.diagnostic.severity.ERROR] = "󰅚 ",
			[vim.diagnostic.severity.WARN] = "󰀪 ",
			[vim.diagnostic.severity.INFO] = "󰋽 ",
			[vim.diagnostic.severity.HINT] = "󰌶 ",
		},
	} or {},
	virtual_text = {
		source = "if_many",
		spacing = 2,
	},
})
