local global = {
	mapleader = " ",
	maplocalleader = " ",
	have_nerd_font = true,
}

for k, v in pairs(global) do
	vim.g[k] = v
end

local opts = {
	backup = false,
	clipboard = "unnamedplus",
	cmdheight = 0,
	completeopt = { "menu", "menuone", "noinsert" },
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
	updatetime = 250,
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
	winborder = "rounded", -- default border for all floating windows (hover, signature, etc.)
}

for k, v in pairs(opts) do
	vim.opt[k] = v
end

-- Set formatoptions separately to avoid concatenation issues
vim.opt.formatoptions:append("orj")

vim.diagnostic.config({
	severity_sort = true,
	update_in_insert = false,
	float = { border = "rounded", source = "if_many" },
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
