local status_ok, blink = pcall(require, "blink.cmp")
if not status_ok then
	return
end

local options = {
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
		default = { "lazydev", "lsp", "path", "buffer", "snippets" },
		providers = {
			lazydev = {
				name = "LazyDev",
				module = "lazydev.integrations.blink",
				score_offset = 100,
			},
			lsp = {
				min_keyword_length = 2,
				score_offset = 0,
			},
			path = {
				min_keyword_length = 0,
			},
			snippets = {
				min_keyword_length = 2,
			},
			buffer = {
				min_keyword_length = 2,
			},
		},
	},

	completion = {
		trigger = {
			show_on_x_blocked_trigger_characters = { "'", '"', "(", "{" },
			show_on_insert_on_trigger_character = false,
		},

		documentation = { auto_show = true, auto_show_delay_ms = 300 },

		menu = {
			draw = {
				columns = { { "kind_icon", "label", gap = 2 }, { "kind" } },
				components = {
					kind_icon = {
						text = function(ctx)
							local icon = ctx.kind_icon
							if vim.tbl_contains({ "Path" }, ctx.source_name) then
								local dev_icon, _ = require("nvim-web-devicons").get_icon(ctx.label)
								if dev_icon then
									icon = dev_icon
								end
							else
								icon = require("lspkind").symbolic(ctx.kind, {
									mode = "symbol",
								})
							end

							return icon .. ctx.icon_gap
						end,

						highlight = function(ctx)
							local hl = ctx.kind_hl
							if vim.tbl_contains({ "Path" }, ctx.source_name) then
								local dev_icon, dev_hl = require("nvim-web-devicons").get_icon(ctx.label)
								if dev_icon then
									hl = dev_hl
								end
							end
							return hl
						end,
					},
				},
			},
		},

		list = {
			selection = {
				auto_insert = true,
				preselect = true,
			},
			cycle = {
				from_bottom = true,
				from_top = true,
			},
		},
	},
}

blink.setup(options)
