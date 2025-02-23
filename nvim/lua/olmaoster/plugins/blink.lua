return {
	{
		"saghen/blink.cmp",
		event = "BufEnter",
		-- dependencies = "rafamadriz/friendly-snippets",
		dependencies = {
			{
				"L3MON4D3/LuaSnip",
				build = (function()
					if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
						return
					end
					return "make install_jsregexp"
				end)(),
				dependencies = {
					{
						"rafamadriz/friendly-snippets",
						config = function()
							require("luasnip.loaders.from_vscode").lazy_load()
						end,
					},
				},
			},
		},

		version = "*",
		opts = {
			keymap = {
				["<C-e>"] = { "hide", "fallback" },
				["<CR>"] = { "accept", "fallback" },

				["<Tab>"] = { "select_next", "fallback" },
				["<S-Tab>"] = { "select_prev", "fallback" },

				["<C-b>"] = { "scroll_documentation_up", "fallback" },
				["<C-f>"] = { "scroll_documentation_down", "fallback" },
			},

			appearance = {
				use_nvim_cmp_as_default = true,
			},

			sources = {
				min_keyword_length = 2,
			},

			completion = {
				trigger = {
					show_on_x_blocked_trigger_characters = { "'", '"', "(", "{" },
					show_on_insert_on_trigger_character = false,
				},
				-- Show documentation when selecting a completion item
				documentation = { auto_show = true, auto_show_delay_ms = 1000 },

				list = {
					selection = function(ctx)
						return ctx.mode == "cmdline" and "auto_insert" or "preselect"
					end,
					cycle = {
						from_bottom = true,
						from_top = true,
					},
				},
			},
		},
		opts_extend = { "sources.default" },
	},
}
