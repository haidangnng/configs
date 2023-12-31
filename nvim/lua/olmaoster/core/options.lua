local options = {
	backup = false,
	clipboard = "unnamedplus",
	cmdheight = 1,
	completeopt = { "menuone", "noselect", "menu" },
	conceallevel = 0,
	fileencoding = "utf-8",
	hlsearch = true,
	ignorecase = true,
	mouse = "a",
	pumheight = 10,
	showmode = true,
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
  numberwidth = 4,                         -- set number column width to 2 {default 4}
	signcolumn = "auto",
	wrap = true,
	scrolloff = 10,
	sidescrolloff = 10,
	guifont = "monospace:h17";
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.o.formatoptions = vim.o.formatoptions .. "orj"
vim.g.dart_format_on_save = 1
