local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("", "<Space>", "<Nop>", opts)

local mappings = {}

mappings.zen = {
	n = {
		["<leader>z"] = { ":ZenMode<CR>", "toggle Zenmode", opts },
	},
}

mappings.maximize = {
	n = {
		["<leader>m"] = { "<Cmd>lua require('maximize').toggle()<CR>", "toggle maximize", opts },
	},
}

mappings.bbye = {
	n = {
		["<leader>d"] = { "<cmd>Bdelete!<cr>", "Close buffer", opts },
		["<leader>qa"] = { "<cmd>bufdo Bdelete!<cr>", "Close all buffer", opts },
	},
}

mappings.nvterm = {
	t = {
		["<C-t>"] = { "<Cmd>:ToggleTerm direction=float<CR>", "Toggle floating term", opts },
	},
	n = {
		["<C-t>"] = { "<Cmd>:ToggleTerm direction=float<CR>", "Toggle floating term", opts },
	},
}

mappings.telescope = {
	n = {
		-- find
		["<leader>ff"] = {
			"<cmd> Telescope current_buffer_fuzzy_find fuzzy=false case_mode=ignore_case <CR>",
			"Find current buffer",
		},
		["<leader>pf"] = { "<cmd> Telescope find_files <CR>", "Find all" },
		["<leader>ps"] = { "<cmd> Telescope live_grep <CR>", "Live grep" },
		["<leader>pb"] = { "<cmd> Telescope buffers <CR>", "Find buffers" },
		["<leader>fh"] = { "<cmd> Telescope help_tags <CR>", "Help page" },
		-- git
		["<leader>cm"] = { "<cmd> Telescope git_commits <CR>", "Git commits" },
		["<leader>gs"] = { "<cmd> Telescope git_status <CR>", "Git status" },
	},
}

-- Your custom mappings
mappings.general = {
	n = {
		["<C-A>"] = { "<C-a>", "Increments", opts },

		["<leader>rf"] = { [[:%s/\<<C-r><C-w>\>//gI<Left><Left><Left>]], "Replacing word in file", opts },
		["<leader>rl"] = { [[:s/\<<C-r><C-w>\>//gI<Left><Left><Left>]], "Replacing word line", opts },
		["<ESC>"] = { ":nohl <CR>", "Remove words highlight", opts },
		["<C-h>"] = { "<CMD>NavigatorLeft<CR>", "Navigate window Left", opts },
		["<C-j>"] = { "<CMD>NavigatorDown<CR>", "Navigate window Down", opts },
		["<C-k>"] = { "<CMD>NavigatorUp<CR>", "Navigate window Up", opts },
		["<C-l>"] = { "<CMD>NavigatorRight<CR>", "Navigate window Right", opts },
		["<leader>sj"] = { ":split<Return><C-w>w", "Split window down", opts },
		["<leader>sl"] = { ":vsplit<Return><C-w>w", "Split window right", opts },
		["<leader>sq"] = { ":close<CR>", "Delete window", opts },
		["<C-d>"] = { "<C-d>zz", "Page down centered cursor", opts },
		["<C-u>"] = { "<C-u>zz", "Page up centered cursor", opts },
	},

	i = {
		-- navigate within insert mode
		["<C-h>"] = { "<Left>", "Move left" },
		["<C-l>"] = { "<Right>", "Move right" },
		["<C-j>"] = { "<Down>", "Move down" },
		["<C-k>"] = { "<Up>", "Move up" },

		-------------------- Press jk fast to enter --------------------
		["jk"] = { "<ESC>", "escape insert mode", opts = { nowait = true } },
		["jK"] = { "<ESC>", "escape insert mode", opts = { nowait = true } },
		["Jk"] = { "<ESC>", "escape insert mode", opts = { nowait = true } },
		["JK"] = { "<ESC>", "escape insert mode", opts = { nowait = true } },
	},

	v = {
		["<C-k>"] = { ":m .-2<CR>==", "Move line block", opts },
		["<C-j>"] = { ":m .+1<CR>==", "Move line block", opts },
		[">"] = { ">gv", "Stay indent mode", opts },
		["<"] = { "<gv", "Stay indent mode", opts },
		["p"] = { '"_dP', "paste without yanking", opts },
		["q"] = { "<ESC>", "escape insert mode", opts = { nowait = true } },
	},

	x = {
		["p"] = { '"_dP', "paste without yanking", opts },
		["J"] = { ":move '>+1<CR>gv-gv", "Move line block", opts },
		["K"] = { ":move '<-2<CR>gv-gv", "Move line block", opts },
		["<C-j>"] = { ":move '>+1<CR>gv-gv", "Move line block", opts },
		["<C-k>"] = { ":move '<-2<CR>gv-gv", "Move line block", opts },
	},
}

mappings.oil = {
	n = {
		["-"] = { "<CMD>Oil<CR>", "Open parent directory" },
	},
}

mappings.trouble = {
	n = {
		["-"] = { "<CMD>Oil<CR>", "Open parent directory" },
		["<leader>xx"] = {
			function()
				require("trouble").toggle()
			end,
			"Toggle trouble",
			opts,
		},
		["<leader>xw"] = {
			function()
				require("trouble").toggle("workspace_diagnostics")
			end,
			"Toggle Trouble workspace_diagnostics",
			opts,
		},
		["gR"] = {
			function()
				require("trouble").toggle("lsp_references")
			end,
			"Toggle Trouble lsp_references",
		},
	},
}

-- " open the REPL terminal buffer
-- au FileType sml nnoremap <silent> <buffer> <leader>is :SMLReplStart<CR>
-- " close the REPL (mnemonic: k -> kill)
-- au FileType sml nnoremap <silent> <buffer> <leader>ik :SMLReplStop<CR>
-- " build the project (using CM if possible)
-- au FileType sml nnoremap <silent> <buffer> <leader>ib :SMLReplBuild<CR>
-- " for opening a structure, not a file
-- au FileType sml nnoremap <silent> <buffer> <leader>io :SMLReplOpen<CR>
-- " use the current file into the REPL (even if using CM)
-- au FileType sml nnoremap <silent> <buffer> <leader>iu :SMLReplUse<CR>
-- " clear the REPL screen
-- au FileType sml nnoremap <silent> <buffer> <leader>ic :SMLReplClear<CR>
-- " set the print depth to 100
-- au FileType sml nnoremap <silent> <buffer> <leader>ip :SMLReplPrintDepth<CR>

local merge_tb = vim.tbl_deep_extend

local load_mappings = function(_, mapping_opt)
	vim.schedule(function()
		local function set_section_map(section_values)
			if section_values.plugin then
				return
			end

			section_values.plugin = nil

			for mode, mode_values in pairs(section_values) do
				local default_opts = merge_tb("force", { mode = mode }, mapping_opt or {})
				for keybind, mapping_info in pairs(mode_values) do
					-- merge default + user opts
					local opts = merge_tb("force", default_opts, mapping_info.opts or {})

					mapping_info.opts, opts.mode = nil, nil
					opts.desc = mapping_info[2]

					vim.keymap.set(mode, keybind, mapping_info[1], opts)
				end
			end
		end

		for _, sect in pairs(mappings) do
			set_section_map(sect)
		end
	end)
end

return load_mappings()
