-- Centralized keymaps configuration
-- All keymaps are organized by category for easy lookup

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Helper function to create options with description
local function desc(description)
	return vim.tbl_extend("force", opts, { desc = description })
end

-- Disable space key in normal mode (leader key)
vim.api.nvim_set_keymap("", "<Space>", "<Nop>", opts)

--------------------------------------------------------------------------------
-- GENERAL
--------------------------------------------------------------------------------
-- Escape and clear
map("n", "<ESC>", ":nohl<CR>", desc("Clear search highlight"))
map("i", "jk", "<ESC>", { noremap = true, desc = "Exit insert mode", nowait = true })
map("i", "jK", "<ESC>", { noremap = true, desc = "Exit insert mode", nowait = true })
map("i", "Jk", "<ESC>", { noremap = true, desc = "Exit insert mode", nowait = true })
map("i", "JK", "<ESC>", { noremap = true, desc = "Exit insert mode", nowait = true })
map("v", "q", "<ESC>", { noremap = true, desc = "Exit visual mode", nowait = true })

-- Navigation with centered cursor
map("n", "<C-d>", "<C-d>zz", desc("Page down (centered)"))
map("n", "<C-u>", "<C-u>zz", desc("Page up (centered)"))

-- Better indenting (stay in visual mode)
map("v", ">", ">gv", desc("Indent right"))
map("v", "<", "<gv", desc("Indent left"))

-- Paste without yanking in visual mode
map("v", "p", '"_dP', desc("Paste without yanking"))
map("x", "p", '"_dP', desc("Paste without yanking"))

-- Move lines in visual mode
map("x", "J", ":move '>+1<CR>gv-gv", desc("Move selection down"))
map("x", "K", ":move '<-2<CR>gv-gv", desc("Move selection up"))

-- Search and replace
map("n", "<leader>rf", [[:%s/\<<C-r><C-w>\>//gI<Left><Left><Left>]], desc("Replace word in file"))
map("n", "<leader>rl", [[:s/\<<C-r><C-w>\>//gI<Left><Left><Left>]], desc("Replace word in line"))

--------------------------------------------------------------------------------
-- WINDOW/SPLIT MANAGEMENT
--------------------------------------------------------------------------------
-- Navigate between splits (requires smart-splits plugin)
map("n", "<C-h>", function()
	require("smart-splits").move_cursor_left()
end, desc("Move to left window"))
map("n", "<C-j>", function()
	require("smart-splits").move_cursor_down()
end, desc("Move to bottom window"))
map("n", "<C-k>", function()
	require("smart-splits").move_cursor_up()
end, desc("Move to top window"))
map("n", "<C-l>", function()
	require("smart-splits").move_cursor_right()
end, desc("Move to right window"))

-- Split windows
map("n", "<leader>sj", ":split<CR><C-w>w", desc("Split window horizontal"))
map("n", "<leader>sl", ":vsplit<CR><C-w>w", desc("Split window vertical"))
map("n", "<leader>sq", ":close<CR>", desc("Close current window"))

--------------------------------------------------------------------------------
-- BUFFER MANAGEMENT
--------------------------------------------------------------------------------
map("n", "<leader>qc", function()
	local bufs = vim.fn.getbufinfo({ buflisted = 1 })
	if #bufs <= 1 then
		vim.cmd("Oil " .. vim.fn.getcwd())
	else
		Snacks.bufdelete()
	end
end, desc("Close current buffer"))

map("n", "<leader>qa", function()
	local current_buf = vim.api.nvim_get_current_buf()
	local all_bufs = vim.api.nvim_list_bufs()
	for _, buf in ipairs(all_bufs) do
		if buf ~= current_buf and vim.api.nvim_buf_is_loaded(buf) then
			require("snacks.bufdelete").delete(buf)
		end
	end
end, desc("Close all buffers except current"))

map("n", "<leader>qq", function()
	local all_bufs = vim.api.nvim_list_bufs()
	for _, buf in ipairs(all_bufs) do
		if vim.api.nvim_buf_is_loaded(buf) then
			require("snacks.bufdelete").delete(buf)
		end
	end
	vim.cmd("Oil " .. vim.fn.getcwd())
end, desc("Close all buffers"))

--------------------------------------------------------------------------------
-- FILE EXPLORER (Oil)
--------------------------------------------------------------------------------
map("n", "-", "<CMD>Oil<CR>", desc("Open parent directory"))

--------------------------------------------------------------------------------
-- TERMINAL (ToggleTerm)
--------------------------------------------------------------------------------
map("n", "<C-t>", "<Cmd>ToggleTerm direction=float<CR>", desc("Toggle floating terminal"))
map("t", "<C-t>", "<Cmd>ToggleTerm<CR>", desc("Toggle floating terminal"))
map("n", "<leader>tj", "<Cmd>ToggleTerm direction=horizontal<CR>", desc("Toggle horizontal terminal"))
map("n", "<leader>tl", "<Cmd>ToggleTerm direction=vertical<CR>", desc("Toggle vertical terminal"))

--------------------------------------------------------------------------------
-- PICKER (Snacks)
--------------------------------------------------------------------------------
-- File/Search pickers
map("n", "<leader>pf", function()
	Snacks.picker.files()
end, desc("Find files"))
map("n", "<leader>ps", function()
	Snacks.picker.grep()
end, desc("Search in files (grep)"))
map("n", "<leader>pb", function()
	Snacks.picker.buffers()
end, desc("Find open buffers"))
map("n", "<leader>ff", function()
	Snacks.picker.lines()
end, desc("Search in current buffer"))
map("n", "<leader>fh", function()
	Snacks.picker.help()
end, desc("Search help tags"))
map("n", "<leader>sk", function()
	Snacks.picker.keymaps({
		layout = {
			layout = {
				backdrop = false,
				width = 0.4,
				height = 0.5,
				box = "vertical",
				border = "rounded",
				title = "{title}",
				title_pos = "center",
				{ win = "input", height = 1, border = "bottom" },
				{ win = "list", border = "none" },
			},
		},
		win = {
			input = {
				keys = {
					["<C-d>"] = { "list_scroll_down", mode = { "i", "n" } },
					["<C-u>"] = { "list_scroll_up", mode = { "i", "n" } },
				},
			},
			list = {
				wo = {
					wrap = true,
					linebreak = true,
				},
			},
		},
		format = function(item, picker)
			local k = item.item
			local lhs = Snacks.util.normkey(k.lhs)
			local desc = k.desc or ""
			local align = Snacks.picker.util.align
			return {
				{ align(lhs, 20), "SnacksPickerKeymapLhs" },
				{ "  " },
				{ desc, "Comment" },
			}
		end,
	})
end, desc("Search keymaps"))

-- Git pickers
map("n", "<leader>cm", function()
	Snacks.picker.git_log()
end, desc("Git commits log"))
map("n", "<leader>gs", function()
	Snacks.picker.git_status()
end, desc("Git status"))

--------------------------------------------------------------------------------
-- GIT
--------------------------------------------------------------------------------
map("n", "<leader>gg", function()
	Snacks.lazygit()
end, desc("Open Lazygit"))
map({ "n", "v" }, "<leader>gb", function()
	Snacks.gitbrowse()
end, desc("Open in GitHub"))

--------------------------------------------------------------------------------
-- LSP
--------------------------------------------------------------------------------
-- Navigation
map("n", "gD", vim.lsp.buf.declaration, desc("Go to declaration"))
map("n", "gd", "<cmd>Lspsaga goto_definition<CR>", desc("Go to definition"))
map("n", "gp", "<cmd>Lspsaga peek_definition<CR>", desc("Peek definition"))
map("n", "gt", "<cmd>Lspsaga peek_type_definition<CR>", desc("Peek type definition"))
map("n", "gf", "<cmd>Lspsaga finder<CR>", desc("Find references & implementations"))
map("n", "gR", function()
	Snacks.picker.lsp_references()
end, desc("List references (picker)"))
map("n", "gi", function()
	Snacks.picker.lsp_implementations()
end, desc("List implementations (picker)"))

-- Actions
map("n", "<leader>ca", vim.lsp.buf.code_action, desc("Code actions"))
map("n", "<leader>rn", vim.lsp.buf.rename, desc("Rename symbol"))
map("n", "<leader>rs", ":LspRestart<CR>", desc("Restart LSP"))
map("n", "K", "<cmd>Lspsaga hover_doc<CR>", desc("Hover documentation"))

-- Diagnostics
map("n", "<leader>d", vim.diagnostic.open_float, desc("Show line diagnostics"))
map("n", "<leader>D", function()
	Snacks.picker.diagnostics_buffer()
end, desc("List buffer diagnostics"))
map("n", "<leader>pd", "<cmd>Lspsaga show_workspace_diagnostics<CR>", desc("List workspace diagnostics"))
map("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", desc("Next diagnostic"))
map("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", desc("Previous diagnostic"))
map("n", "]D", function()
	require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
end, desc("Next error"))
map("n", "[D", function()
	require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, desc("Previous error"))

-- Word navigation (LSP references under cursor)
map("n", "]]", function()
	Snacks.words.jump(vim.v.count1)
end, desc("Next word reference"))
map("n", "[[", function()
	Snacks.words.jump(-vim.v.count1)
end, desc("Previous word reference"))

--------------------------------------------------------------------------------
-- DEBUGGER (DAP)
--------------------------------------------------------------------------------
map("n", "<leader>db", "<cmd>DapToggleBreakpoint<CR>", desc("Toggle breakpoint"))
map("n", "<leader>dr", "<cmd>DapContinue<CR>", desc("Start/Continue debugger"))

--------------------------------------------------------------------------------
-- TASK RUNNER (Overseer)
--------------------------------------------------------------------------------
map("n", "<leader>or", "<cmd>OverseerRun<CR>", desc("Run build task"))

--------------------------------------------------------------------------------
-- ZEN MODE
--------------------------------------------------------------------------------
map("n", "<leader>z", function()
	Snacks.zen()
end, desc("Toggle zen mode"))
map("n", "<leader>Z", function()
	Snacks.zen.zoom()
end, desc("Toggle zoom"))
