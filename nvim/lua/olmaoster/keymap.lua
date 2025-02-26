local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("", "<Space>", "<Nop>", opts)

local mappings = {}

mappings.bbye = {
	n = {
		["<leader>qc"] = { "<cmd>lua MiniBufremove.delete()<cr>", "Close buffer", opts },
		["<leader>qa"] = { "<cmd>BufRemoveAll all<cr>", "Close all buffer", opts },
		["<leader>qx"] = { "<cmd>BufRemoveAll others<cr>", "Close all buffer except current", opts },
	},
}

mappings.leet = {
	n = {
		["<leader>lc"] = { "<cmd>Leet<cr>", "Leetcode run testcases", opts },
		["<leader>lcr"] = { "<cmd>Leet run<cr>", "Leetcode run testcases", opts },
		["<leader>lcs"] = { "<cmd>Leet submit<cr>", "Leetcode submit", opts },
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
		["<leader>rf"] = { [[:%s/\<<C-r><C-w>\>//gI<Left><Left><Left>]], "Replacing word in file", opts },
		["<leader>rl"] = { [[:s/\<<C-r><C-w>\>//gI<Left><Left><Left>]], "Replacing word line", opts },
		["<ESC>"] = { ":nohl <CR>", "Remove words highlight", opts },

		["<C-h>"] = {
			function()
				require("smart-splits").move_cursor_left()
			end,
			"Navigate window Left",
			opts,
		},
		["<C-j>"] = {
			function()
				require("smart-splits").move_cursor_down()
			end,
			"Navigate window Down",
			opts,
		},
		["<C-k>"] = {
			function()
				require("smart-splits").move_cursor_up()
			end,
			"Navigate window Up",
			opts,
		},
		["<C-l>"] = {
			function()
				require("smart-splits").move_cursor_right()
			end,
			"Navigate window Right",
			opts,
		},
		["<leader>sj"] = { ":split<Return><C-w>w", "Split window down", opts },
		["<leader>sl"] = { ":vsplit<Return><C-w>w", "Split window right", opts },
		["<leader>sq"] = { ":close<CR>", "Delete window", opts },
		["<C-d>"] = { "<C-d>zz", "Page down centered cursor", opts },
		["<C-u>"] = { "<C-u>zz", "Page up centered cursor", opts },
	},

	i = {
		-------------------- Press jk fast to enter --------------------
		["jk"] = { "<ESC>", "escape insert mode", opts = { nowait = true } },
		["jK"] = { "<ESC>", "escape insert mode", opts = { nowait = true } },
		["Jk"] = { "<ESC>", "escape insert mode", opts = { nowait = true } },
		["JK"] = { "<ESC>", "escape insert mode", opts = { nowait = true } },
	},

	v = {
		[">"] = { ">gv", "Stay indent mode", opts },
		["<"] = { "<gv", "Stay indent mode", opts },
		["p"] = { '"_dP', "paste without yanking", opts },
		["q"] = { "<ESC>", "escape insert mode", opts = { nowait = true } },
	},

	x = {
		["p"] = { '"_dP', "paste without yanking", opts },
		["J"] = { ":move '>+1<CR>gv-gv", "Move line block", opts },
		["K"] = { ":move '<-2<CR>gv-gv", "Move line block", opts },
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

mappings.lspsaga = {
	n = {
		["gR"] = { "<cmd>Telescope lsp_references<CR>", "Show LSP references", opts },
		["gD"] = { vim.lsp.buf.declaration, "Go to declaration", opts }, -- go to declaration
		["gi"] = { "<cmd>Telescope lsp_implementations<CR>", "Show LSP implementations", opts }, -- show lsp implementations
		["<leader>ca"] = { vim.lsp.buf.code_action, "See available code actions", opts }, -- see available code actions, in visual mode will apply to selection
		["<leader>rn"] = { vim.lsp.buf.rename, "Smart rename", opts }, -- smart rename
		["<leader>D"] = { "<cmd>Telescope diagnostics bufnr=0<CR>", "Show buffer diagnostics", opts }, -- show  diagnostics for file
		["<leader>d"] = { vim.diagnostic.open_float, "Show line diagnostics", opts }, -- show diagnostics for line
		["<leader>rs"] = { ":LspRestart<CR>", "Restart LSP", opts },
		["gf"] = { "<cmd>Lspsaga finder<CR>", "LSP Finder", opts },
		["gr"] = { "<cmd>Lspsaga rename<CR>", "LSP rename", opts },
		["gp"] = { "<cmd>Lspsaga peek_definition<CR>", "LSP Peek definition", opts },
		["gd"] = { "<cmd>Lspsaga goto_definition<CR>", "LSP Go to definition", opts },
		["gt"] = { "<cmd>Lspsaga peek_type_definition<CR>", "LSP Peek type definition", opts },
		["<leader>pd"] = { "<cmd>Lspsaga show_workspace_diagnostics<CR>", "LSP Show workspace diagnostics", opts },
		["]d"] = { "<cmd>Lspsaga diagnostic_jump_next<CR>", "LSP jump next diagnostics", opts },
		["[d"] = { "<cmd>Lspsaga diagnostic_jump_prev<CR>", "LSP jump prev diagnostics", opts },
		["[D"] = {
			function()
				require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
			end,
			"go to prev error",
			opts,
		},
		["]D"] = {
			function()
				require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
			end,
			"go to next error",
			opts,
		},
		["K"] = { "<cmd>Lspsaga hover_doc<CR>", "Hover docs", opts },
	},
}

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
