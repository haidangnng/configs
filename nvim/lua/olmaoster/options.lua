local global = {
	mapleader = " ",
	maplocalleader = " ",
	dart_format_on_save = 1,
}

for k, v in pairs(global) do
	vim.g[k] = v
end

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
	numberwidth = 2, -- set number column width to 2 {default 4}
	signcolumn = "yes",
	wrap = true,
	scrolloff = 10,
	formatoptions = vim.o.formatoptions .. "orj",
	list = true,
	listchars = { tab = "» ", trail = "·", nbsp = "␣" },
}

for k, v in pairs(options) do
	vim.opt[k] = v
end
