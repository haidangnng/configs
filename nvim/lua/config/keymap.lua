local mapping_opt = { noremap = true, silent = true }
vim.api.nvim_set_keymap("", "<Space>", "<Nop>", mapping_opt)
local merge_tb = vim.tbl_deep_extend
local mappings = {}

----- BUFREMOVE -----
mappings.bufremove = {
	n = {
		["<leader>qa"] = {
			function()
				local current_buf = vim.api.nvim_get_current_buf()
				local all_bufs = vim.api.nvim_list_bufs()
				for _, buf in ipairs(all_bufs) do
					if buf ~= current_buf and vim.api.nvim_buf_is_loaded(buf) then
						require("snacks.bufdelete").delete(buf)
					end
				end
			end,
			"Delete all buffers except current",
			mapping_opt,
		},
		["<leader>qq"] = {
			function()
				local all_bufs = vim.api.nvim_list_bufs()
				for _, buf in ipairs(all_bufs) do
					if vim.api.nvim_buf_is_loaded(buf) then
						require("snacks.bufdelete").delete(buf)
					end
				end
				vim.cmd("Oil " .. vim.fn.getcwd())
			end,
			"Delete all buffers and open Oil",
			mapping_opt,
		},
		-- Buffer delete is now handled by snacks.nvim in plugins/snacks.lua
	},
}
----- TERMINAL -----
mappings.terminal = {
	t = {
		["<C-t>"] = { "<Cmd>:ToggleTerm<CR>", "Toggle floating [T]erminal", mapping_opt },
	},
	n = {
		["<C-t>"] = { "<Cmd>:ToggleTerm direction=float<CR>", "Toggle floating [T]erminal", mapping_opt },
		["<leader>tj"] = {
			"<Cmd>:ToggleTerm direction=horizontal<CR>",
			"Toggle horizontal [T]erminal",
			mapping_opt,
		},
		["<leader>tl"] = {
			"<Cmd>:ToggleTerm direction=vertical<CR>",
			"Toggle vertical [T]erminal",
			mapping_opt,
		},
	},
}
----- OIL - FE -----
mappings.oil = {
	n = {
		["-"] = { "<CMD>Oil<CR>", "Open parent directory" },
	},
}
----- LEET CODE -----
mappings.leet = {
	n = {
		["<leader>lc"] = { "<cmd>Leet<cr>", "Leetcode", mapping_opt },
		["<leader>lcr"] = { "<cmd>Leet run<cr>", "Leetcode run testcases", mapping_opt },
		["<leader>lcs"] = { "<cmd>Leet submit<cr>", "Leetcode submit", mapping_opt },
	},
}
----- OVERSEER -----
mappings.overseer = {
	n = {
		["<leader>or"] = {
			"<cmd>OverseerRun <CR>",
			"Run build template",
			mapping_opt,
		},
	},
}
mappings.dap = {
	n = {
		["<leader>db"] = {
			"<cmd> DapToggleBreakpoint <CR>",
			"Add breakpoint at line",
			mapping_opt,
		},
		["<leader>dr"] = {
			"<cmd> DapContinue <CR>",
			"Start or continue the debugger",
			mapping_opt,
		},
	},
}
----- LSP -----
mappings.lsp = {
	n = {
		-- Removed gR, gi, <leader>D as they are now handled by snacks.picker
		["gD"] = { vim.lsp.buf.declaration, "Go to declaration", mapping_opt },
		["<leader>ca"] = { vim.lsp.buf.code_action, "See available code actions", mapping_opt },
		["<leader>rn"] = { vim.lsp.buf.rename, "Smart rename", mapping_opt },
		["<leader>d"] = { vim.diagnostic.open_float, "Show line diagnostics", mapping_opt },
		["<leader>rs"] = { ":LspRestart<CR>", "Restart LSP", mapping_opt },
		["gf"] = { "<cmd>Lspsaga finder<CR>", "LSP Finder", mapping_opt },
		["gr"] = { "<cmd>Lspsaga rename<CR>", "LSP rename", mapping_opt },
		["gp"] = { "<cmd>Lspsaga peek_definition<CR>", "LSP Peek definition", mapping_opt },
		["gd"] = { "<cmd>Lspsaga goto_definition<CR>", "LSP Go to definition", mapping_opt },
		["gt"] = { "<cmd>Lspsaga peek_type_definition<CR>", "LSP Peek type definition", mapping_opt },
		["<leader>pd"] = {
			"<cmd>Lspsaga show_workspace_diagnostics<CR>",
			"LSP Show workspace diagnostics",
			mapping_opt,
		},
		["]d"] = { "<cmd>Lspsaga diagnostic_jump_next<CR>", "LSP jump next diagnostics", mapping_opt },
		["[d"] = { "<cmd>Lspsaga diagnostic_jump_prev<CR>", "LSP jump prev diagnostics", mapping_opt },
		["[D"] = {
			function()
				require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
			end,
			"go to prev error",
			mapping_opt,
		},
		["]D"] = {
			function()
				require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
			end,
			"go to next error",
			mapping_opt,
		},
		["K"] = { "<cmd>Lspsaga hover_doc<CR>", "Hover docs", mapping_opt },
	},
}
----- SPLIT VIEW -----
mappings.splits = {
	n = {
		["<C-h>"] = {
			function()
				require("smart-splits").move_cursor_left()
			end,
			"Navigate window Left",
			mapping_opt,
		},
		["<C-j>"] = {
			function()
				require("smart-splits").move_cursor_down()
			end,
			"Navigate window Down",
			mapping_opt,
		},
		["<C-k>"] = {
			function()
				require("smart-splits").move_cursor_up()
			end,
			"Navigate window Up",
			mapping_opt,
		},
		["<C-l>"] = {
			function()
				require("smart-splits").move_cursor_right()
			end,
			"Navigate window Right",
			mapping_opt,
		},
		["<leader>sj"] = { ":split<Return><C-w>w", "Split window down", mapping_opt },
		["<leader>sl"] = { ":vsplit<Return><C-w>w", "Split window right", mapping_opt },
		["<leader>sq"] = { ":close<CR>", "Delete window", mapping_opt },
	},
}
----- GENERAL -----
mappings.general = {
	n = {
		["<leader>rf"] = { [[:%s/\<<C-r><C-w>\>//gI<Left><Left><Left>]], "Replacing word in file", mapping_opt },
		["<leader>rl"] = { [[:s/\<<C-r><C-w>\>//gI<Left><Left><Left>]], "Replacing word line", mapping_opt },
		["<ESC>"] = { ":nohl <CR>", "Remove words highlight", mapping_opt },
		["<C-d>"] = { "<C-d>zz", "Page down centered cursor", mapping_opt },
		["<C-u>"] = { "<C-u>zz", "Page up centered cursor", mapping_opt },
	},
	i = {
		["jk"] = { "<ESC>", "escape insert mode", opts = { nowait = true } },
		["jK"] = { "<ESC>", "escape insert mode", opts = { nowait = true } },
		["Jk"] = { "<ESC>", "escape insert mode", opts = { nowait = true } },
		["JK"] = { "<ESC>", "escape insert mode", opts = { nowait = true } },
	},
	v = {
		[">"] = { ">gv", "Stay indent mode", mapping_opt },
		["<"] = { "<gv", "Stay indent mode", mapping_opt },
		["p"] = { '"_dP', "paste without yanking", mapping_opt },
		["q"] = { "<ESC>", "escape insert mode", opts = { nowait = true } },
	},
	x = {
		["p"] = { '"_dP', "paste without yanking", mapping_opt },
		["J"] = { ":move '>+1<CR>gv-gv", "Move line block", mapping_opt },
		["K"] = { ":move '<-2<CR>gv-gv", "Move line block", mapping_opt },
	},
}
local load_mappings = function(_, opt)
	vim.schedule(function()
		local function set_section_map(section_values)
			if section_values.plugin then
				return
			end
			section_values.plugin = nil
			for mode, mode_values in pairs(section_values) do
				local default_opts = merge_tb("force", { mode = mode }, opt or {})
				for keybind, mapping_info in pairs(mode_values) do
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
