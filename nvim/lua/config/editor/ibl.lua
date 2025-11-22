local highlight = {
	"RainbowViolet",
}

local hooks = require("ibl.hooks")

hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
	vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#BF77F6" })
end)

hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)
hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_tab_indent_level)

require("ibl").setup({
	indent = {
		char = "┊", -- This is a slightly thinner char than the default one, check :help ibl.config.indent.char
	},
	scope = {
		enabled = true,
		highlight = highlight,
		-- show_exact_scope = true,
		show_start = false,
		show_end = false,
		include = {
			node_type = { ["*"] = { "*" } },
		},
	},
})
