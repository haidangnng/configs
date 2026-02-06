require("kanagawa").setup({
	undercurl = true, -- enable undercurls
	commentStyle = { italic = true },
	functionStyle = { bold = true },
	keywordStyle = { italic = true },
	statementStyle = { bold = true },
	typeStyle = { italic = true, bold = true },
	transparent = true, -- do not set background color
	dimInactive = false, -- dim inactive window `:h hl-NormalNC`
	terminalColors = true, -- define vim.g.terminal_color_{0,17}
	theme = "lotus", -- Load "wave" theme
	overrides = function(colors)
		local theme = colors.theme
		return {
			-- Line number column background matches normal background
			LineNr = { bg = "NONE" },
			LineNrAbove = { bg = "NONE" },
			LineNrBelow = { bg = "NONE" },
			SignColumn = { bg = "NONE" },
			-- Picker/float background matches normal background
			NormalFloat = { bg = "NONE" },
			FloatBorder = { bg = "NONE" },
			FloatTitle = { bg = "NONE" },
			-- Snacks terminal backgrounds
			SnacksTerminalNormal = { bg = "NONE" },
			SnacksTerminalBorder = { bg = "NONE" },
			SnacksTerminalTitle = { bg = "NONE" },
			-- Snacks picker backgrounds
			SnacksPickerNormal = { bg = "NONE" },
			SnacksPickerBorder = { bg = "NONE" },
			SnacksPickerTitle = { bg = "NONE" },
			SnacksPickerPreviewNormal = { bg = "NONE" },
			SnacksPickerPreviewBorder = { bg = "NONE" },
			SnacksPickerPreviewTitle = { bg = "NONE" },
			-- Snacks input backgrounds
			SnacksInputNormal = { bg = "NONE" },
			SnacksInputBorder = { bg = "NONE" },
			SnacksInputTitle = { bg = "NONE" },
			-- Popup menu backgrounds
			Pmenu = { bg = theme.ui.bg_p1 },
			PmenuSel = { bg = theme.ui.bg_p2 },
		}
	end,
})

vim.cmd.colorscheme("kanagawa")

-- Additional overrides for Snacks picker to ensure transparent background
vim.api.nvim_set_hl(0, "SnacksPickerNormal", { bg = "NONE" })
vim.api.nvim_set_hl(0, "SnacksPickerBorder", { bg = "NONE" })
vim.api.nvim_set_hl(0, "SnacksPickerTitle", { bg = "NONE" })
vim.api.nvim_set_hl(0, "SnacksPickerPreviewNormal", { bg = "NONE" })
vim.api.nvim_set_hl(0, "SnacksPickerPreviewBorder", { bg = "NONE" })
vim.api.nvim_set_hl(0, "SnacksPickerPreviewTitle", { bg = "NONE" })
vim.api.nvim_set_hl(0, "SnacksInputNormal", { bg = "NONE" })
vim.api.nvim_set_hl(0, "SnacksInputBorder", { bg = "NONE" })
vim.api.nvim_set_hl(0, "SnacksInputTitle", { bg = "NONE" })
vim.api.nvim_set_hl(0, "SnacksTerminalNormal", { bg = "NONE" })
vim.api.nvim_set_hl(0, "SnacksTerminalBorder", { bg = "NONE" })
vim.api.nvim_set_hl(0, "SnacksTerminalTitle", { bg = "NONE" })
