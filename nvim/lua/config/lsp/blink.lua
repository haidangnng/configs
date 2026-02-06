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

		-- Manual trigger for when auto-completion doesn't show
		["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
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
			show_on_insert_on_trigger_character = true,
			-- Show completion after typing any keyword character
			show_in_snippet = true,
		},

		-- Don't auto-select/insert, let user explicitly choose
		ghost_text = { enabled = false },

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

-- Helper function to reload autopairs
local function reload_autopairs()
	-- Clear autopairs modules
	for key, _ in pairs(package.loaded) do
		if key:match("^nvim%-autopairs") then
			package.loaded[key] = nil
		end
	end

	-- Re-require and setup autopairs
	local ap_ok, autopairs = pcall(require, "nvim-autopairs")
	if ap_ok then
		autopairs.setup({})
		return true
	end
	return false
end

-- Helper function to reload blink.cmp
local function reload_blink()
	-- Clear any cached modules related to blink
	for key, _ in pairs(package.loaded) do
		if key:match("^blink") then
			package.loaded[key] = nil
		end
	end

	-- Re-require and setup
	local ok, reloaded_blink = pcall(require, "blink.cmp")
	if ok then
		reloaded_blink.setup(options)
		return true
	end
	return false
end

-- Command to reload/reset blink.cmp without restarting nvim
vim.api.nvim_create_user_command("BlinkReload", function()
	if reload_blink() then
		vim.notify("Blink.cmp reloaded successfully", vim.log.levels.INFO)
	else
		vim.notify("Failed to reload blink.cmp", vim.log.levels.ERROR)
	end
end, { desc = "Reload blink.cmp completion" })

-- Command to reload autopairs
vim.api.nvim_create_user_command("AutopairsReload", function()
	if reload_autopairs() then
		vim.notify("Autopairs reloaded successfully", vim.log.levels.INFO)
	else
		vim.notify("Failed to reload autopairs", vim.log.levels.ERROR)
	end
end, { desc = "Reload nvim-autopairs" })

-- Command to reset everything: blink.cmp, autopairs, and LSP
vim.api.nvim_create_user_command("CompletionReset", function()
	local results = {}

	-- Reload blink
	if reload_blink() then
		table.insert(results, "blink.cmp ✓")
	else
		table.insert(results, "blink.cmp ✗")
	end

	-- Reload autopairs
	if reload_autopairs() then
		table.insert(results, "autopairs ✓")
	else
		table.insert(results, "autopairs ✗")
	end

	-- Restart LSP
	vim.cmd("LspRestart")
	table.insert(results, "LSP restarted")

	vim.notify("Completion reset: " .. table.concat(results, ", "), vim.log.levels.INFO)
end, { desc = "Reset completion, autopairs, and LSP" })
