return {
	-- DETECT TABSTOP AND SHIFTWIDTH AUTOMATICALLY
	"tpope/vim-sleuth",

	-- TELESCOPE --
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			{ "nvim-telescope/telescope-media-files.nvim" },
			{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
		},
		cmd = "Telescope",
		config = function()
			require("olmaoster.configs.telescope")
		end,
	},

	--- FILE EXPLORER AS BUFFER ---
	{
		"stevearc/oil.nvim",
		opts = {
			default_file_explorer = true,
			columns = {
				"icon",
			},
			view_options = {
				-- Show files and directories that start with "."
				show_hidden = true,
				skip_confirm_for_simple_edits = true,
				-- This function defines what is considered a "hidden" file
				is_hidden_file = function(name)
					return vim.startswith(name, ".")
				end,
				-- This function defines what will never be shown, even when `show_hidden` is set
				is_always_hidden = function()
					return false
				end,
			},
			keymaps = {
				["g?"] = "actions.show_help",
				["<CR>"] = "actions.select",
				["-"] = "actions.parent",
				["_"] = "actions.open_cwd",
				["`"] = "actions.cd",
				["~"] = "actions.tcd",
				["g."] = "actions.toggle_hidden",
			},
			use_default_keymaps = false,
		},
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	-- TERMINAL --
	{
		"akinsho/toggleterm.nvim",
		event = "VeryLazy",
		version = "*",
		config = function()
			require("toggleterm").setup({})
		end,
	},

	--- DIAGNOSTIC AS QUICKLIST ---
	{
		"folke/trouble.nvim",
		event = "VeryLazy",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {},
	},

	--- IMPROVING f,F,b,B ---
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = {},
		-- stylua: ignore
		keys = {
			{ "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
			{ "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
			{ "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
			{ "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
			{ "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
		},
	},

	--- NAVIGATOR ---
	{
		"numToStr/Navigator.nvim",
		event = "VeryLazy",
		config = function()
			require("Navigator").setup()
		end,
	},

	---- TREESITTER ---
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("olmaoster.configs.treesitter")
		end,
	},

	--- SURROUND ---
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	},

	--- MAXIMIZE WINDOW PANE ---
	{
		"declancm/maximize.nvim",
		config = function()
			require("maximize").setup()
		end,
	},

	--- ZEN MODE ---
	{
		"folke/zen-mode.nvim",
		event = "VeryLazy",
	},

	--- BUFFER CLOSE ---
	{
		"moll/vim-bbye",
		event = { "BufRead" },
	},

	--- ILLUMINATE ---
	{
		"RRethy/vim-illuminate",
		event = { "BufReadPost", "BufNewFile" },
		opts = {
			filetypes_denylist = {
				"dirvish",
				"fugitive",
				"neo-tree",
				"alpha",
				"NvimTree",
				"dashboard",
				"TelescopePrompt",
				"TelescopeResult",
				"DressingInput",
				"neo-tree-popup",
				"",
			},
			delay = 100,
			modes_denylist = { "i", "v" },
		},
		config = function(_, opts)
			require("illuminate").configure(opts)

			local function map(key, dir, buffer)
				vim.keymap.set("n", key, function()
					require("illuminate")["goto_" .. dir .. "_reference"](false)
				end, { desc = dir:sub(1, 1):upper() .. dir:sub(2) .. " Reference", buffer = buffer })
			end

			map("]]", "next")
			map("[[", "prev")

			-- also set it after loading ftplugins, since a lot overwrite [[ and ]]
			vim.api.nvim_create_autocmd("FileType", {
				callback = function()
					local buffer = vim.api.nvim_get_current_buf()
					map("]]", "next", buffer)
					map("[[", "prev", buffer)
				end,
			})
		end,
		keys = {
			{ "]]", desc = "Next Reference" },
			{ "[[", desc = "Prev Reference" },
		},
	},

	--- AUTOPAIRS BRACKETS ---
	{
		"windwp/nvim-autopairs",
		event = { "BufRead" },
		opts = {
			fast_wrap = {},
			disable_filetype = { "TelescopePrompt", "vim" },
		},
		config = function(_, opts)
			require("nvim-autopairs").setup(opts)
			-- setup cmp for autopairs
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
		end,
	},
	{
		"windwp/nvim-ts-autotag",
		filetypes = { "html", "javascript", "javascriptreact", "typescriptreact", "svelte", "vue", "xml" },
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	},

	--- COMMENTS ---
	{
		"numToStr/Comment.nvim",
		event = { "BufReadPost", "BufNewFile" },
		keys = {
			{ "gcc", mode = "n", desc = "Comment toggle current line" },
			{ "gc", mode = { "n", "o" }, desc = "Comment toggle linewise" },
			{ "gc", mode = "x", desc = "Comment toggle linewise (visual)" },
			{ "gbc", mode = "n", desc = "Comment toggle current block" },
			{ "gb", mode = { "n", "o" }, desc = "Comment toggle blockwise" },
			{ "gb", mode = "x", desc = "Comment toggle blockwise (visual)" },
		},
		config = function(_, opts)
			require("Comment").setup(vim.tbl_deep_extend("force", opts, {
				pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
			}))
		end,
	},
	{ "JoosepAlviste/nvim-ts-context-commentstring" },

	--- GITSIGNS ---
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufRead" },
		config = function()
			require("olmaoster.configs.gitsigns")
		end,
	},
}
