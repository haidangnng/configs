-- Oxocarbon colorscheme configuration
vim.cmd.colorscheme("oxocarbon")

-- Set border highlights to make them visible
-- Using oxocarbon's color palette
local colors = {
	-- Oxocarbon color palette
	base00 = "#161616", -- Background
	base01 = "#262626", -- Lighter background
	base02 = "#393939", -- Selection background
	base03 = "#525252", -- Comments, invisibles
	base04 = "#dde1e6", -- Dark foreground
	base05 = "#f2f4f8", -- Default foreground
	base06 = "#ffffff", -- Light foreground
	base07 = "#08bdba", -- Cyan
	base08 = "#3ddbd9", -- Light cyan
	base09 = "#78a9ff", -- Blue
	base10 = "#ee5396", -- Pink
	base11 = "#33b1ff", -- Light blue
	base12 = "#ff7eb6", -- Light pink
	base13 = "#42be65", -- Green
	base14 = "#be95ff", -- Purple
	base15 = "#82cfff", -- Light blue
}

-- Set border highlights for float windows
vim.api.nvim_set_hl(0, "FloatBorder", { fg = colors.base14, bg = colors.base00 })
vim.api.nvim_set_hl(0, "FloatTitle", { fg = colors.base05, bg = colors.base00, bold = true })

-- Snacks terminal borders
vim.api.nvim_set_hl(0, "SnacksTerminalNormal", { bg = colors.base00 })
vim.api.nvim_set_hl(0, "SnacksTerminalBorder", { fg = colors.base14, bg = colors.base00 })
vim.api.nvim_set_hl(0, "SnacksTerminalTitle", { fg = colors.base05, bg = colors.base00, bold = true })

-- Snacks picker borders
vim.api.nvim_set_hl(0, "SnacksPickerBorder", { fg = colors.base14, bg = colors.base00 })
vim.api.nvim_set_hl(0, "SnacksPickerTitle", { fg = colors.base05, bg = colors.base00, bold = true })
vim.api.nvim_set_hl(0, "SnacksPickerPreviewBorder", { fg = colors.base14, bg = colors.base00 })
vim.api.nvim_set_hl(0, "SnacksPickerPreviewTitle", { fg = colors.base05, bg = colors.base00, bold = true })

-- Additional picker highlights
vim.api.nvim_set_hl(0, "SnacksInputBorder", { fg = colors.base14, bg = colors.base00 })
vim.api.nvim_set_hl(0, "SnacksInputTitle", { fg = colors.base05, bg = colors.base00, bold = true })
