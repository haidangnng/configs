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
				-- make lazydev completions top priority (see `:h blink.cmp`)
				score_offset = 100,
			},
			lsp = {
				min_keyword_length = 2, -- Number of characters to trigger porvider
				score_offset = 0, -- Boost/penalize the score of the items
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
		-- Show documentation when selecting a completion item
		documentation = { auto_show = true, auto_show_delay_ms = 1000 },

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
