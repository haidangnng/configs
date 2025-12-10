return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		bigfile = { enabled = true },
		bufdelete = { enabled = true },
		gitbrowse = { enabled = true },
		indent = { enabled = true },
		lazygit = { enabled = true },
		picker = {
			enabled = true,
			win = {
				input = {
					keys = {
						["<C-l>"] = "select_vsplit",
						["<C-j>"] = "select_split",
						["<C-e>"] = "close",
						["q"] = { "close", mode = "n" },
						["<C-d>"] = { "preview_scroll_down", mode = { "i", "n" } },
						["<C-u>"] = { "preview_scroll_up", mode = { "i", "n" } },
					},
				},
			},
			layout = {
				preset = "sidebar",
				preview = "main",
			},
			formatters = {
				file = {
					filename_first = true,
				},
			},
		},
		quickfile = { enabled = true },
		scope = { enabled = true },
		statuscolumn = { enabled = true },
		words = { enabled = true },
		zen = { enabled = true },
	},
	config = function(_, opts)
		local snacks = require("snacks")
		snacks.setup(opts)

		-- Custom highlight groups for git pickers with better visibility
		-- Use brighter colors without backgrounds
		vim.api.nvim_set_hl(0, "SnacksPickerGitAdd", { fg = "#9ece6a", bold = true })
		vim.api.nvim_set_hl(0, "SnacksPickerGitChange", { fg = "#e0af68", bold = true })
		vim.api.nvim_set_hl(0, "SnacksPickerGitDelete", { fg = "#f7768e", bold = true })
	end,
	keys = {
		-- Picker (replacing telescope)
		{
			"<leader>pf",
			function()
				Snacks.picker.files()
			end,
			desc = "Find all files",
		},
		{
			"<leader>ps",
			function()
				Snacks.picker.grep()
			end,
			desc = "Live grep",
		},
		{
			"<leader>pb",
			function()
				Snacks.picker.buffers()
			end,
			desc = "Find buffers",
		},
		{
			"<leader>ff",
			function()
				Snacks.picker.lines()
			end,
			desc = "Find in current buffer",
		},
		{
			"<leader>fh",
			function()
				Snacks.picker.help()
			end,
			desc = "Help tags",
		},

		-- Git pickers
		{
			"<leader>cm",
			function()
				Snacks.picker.git_log()
			end,
			desc = "Git commits",
		},
		{
			"<leader>gs",
			function()
				Snacks.picker.git_status()
			end,
			desc = "Git status",
		},

		-- LSP pickers
		{
			"gR",
			function()
				Snacks.picker.lsp_references()
			end,
			desc = "LSP references",
		},
		{
			"gi",
			function()
				Snacks.picker.lsp_implementations()
			end,
			desc = "LSP implementations",
		},
		{
			"<leader>D",
			function()
				Snacks.picker.diagnostics_buffer()
			end,
			desc = "Buffer diagnostics",
		},

		-- Zen mode
		{
			"<leader>z",
			function()
				Snacks.zen()
			end,
			desc = "Toggle Zen Mode",
		},
		{
			"<leader>Z",
			function()
				Snacks.zen.zoom()
			end,
			desc = "Toggle Zoom",
		},

		-- Buffer delete with Oil fallback
		{
			"<leader>qc",
			function()
				local bufs = vim.fn.getbufinfo({ buflisted = 1 })
				if #bufs <= 1 then
					vim.cmd("Oil " .. vim.fn.getcwd())
				else
					Snacks.bufdelete()
				end
			end,
			desc = "Delete current buffer",
		},

		-- Git browse
		{
			"<leader>gb",
			function()
				Snacks.gitbrowse()
			end,
			desc = "Git Browse",
			mode = { "n", "v" },
		},

		-- Lazygit
		{
			"<leader>gg",
			function()
				Snacks.lazygit()
			end,
			desc = "Lazygit",
		},

		-- Words navigation (LSP references)
		{
			"]]",
			function()
				Snacks.words.jump(vim.v.count1)
			end,
			desc = "Next Reference",
		},
		{
			"[[",
			function()
				Snacks.words.jump(-vim.v.count1)
			end,
			desc = "Prev Reference",
		},
	},
}
