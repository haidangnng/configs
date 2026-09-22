local util = require("config.keymaps.util")
local map = util.map
local desc = util.desc

-- Navigate between splits with fallback to wezterm/aerospace
local function smart_move(direction)
	return function()
		local smart_splits = require("smart-splits")

		-- Get current window ID
		local current_win = vim.api.nvim_get_current_win()

		-- Try to move within nvim
		if direction == "left" then
			smart_splits.move_cursor_left()
		elseif direction == "down" then
			smart_splits.move_cursor_down()
		elseif direction == "up" then
			smart_splits.move_cursor_up()
		elseif direction == "right" then
			smart_splits.move_cursor_right()
		end

		-- Check if we actually moved
		local new_win = vim.api.nvim_get_current_win()

		-- Debug log
		local debug_file = io.open("/tmp/nvim_nav_debug.txt", "a")
		if debug_file then
			debug_file:write(os.date("%Y-%m-%d %H:%M:%S") .. " - direction=" .. direction .. " current_win=" .. current_win .. " new_win=" .. new_win .. "\n")
			debug_file:close()
		end

		if current_win == new_win then
			-- We're at the edge, call wezterm navigation
			local pane_id = vim.env.WEZTERM_PANE
			if pane_id then
				local dir_map = { left = "h", down = "j", up = "k", right = "l" }
				local key = dir_map[direction]
				if key then
					-- Debug log
					local debug_file2 = io.open("/tmp/nvim_nav_debug.txt", "a")
					if debug_file2 then
						debug_file2:write(os.date("%Y-%m-%d %H:%M:%S") .. " - EDGE DETECTED! Calling script with pane_id=" .. pane_id .. " key=" .. key .. "\n")
						debug_file2:close()
					end

					-- Use job_start to run async without blocking
					vim.fn.jobstart({
						"bash",
						vim.env.HOME .. "/.config/wezterm/navigate.sh",
						pane_id,
						key
					}, {
						detach = true
					})
				end
			end
		end
	end
end

map("n", "<C-h>", smart_move("left"), desc("Move to left window"))
map("n", "<C-j>", smart_move("down"), desc("Move to bottom window"))
map("n", "<C-k>", smart_move("up"), desc("Move to top window"))
map("n", "<C-l>", smart_move("right"), desc("Move to right window"))

-- Resize splits (smart-splits)
map("n", "<C-Left>", function()
	require("smart-splits").resize_left()
end, desc("Resize split left"))
map("n", "<C-Down>", function()
	require("smart-splits").resize_down()
end, desc("Resize split down"))
map("n", "<C-Up>", function()
	require("smart-splits").resize_up()
end, desc("Resize split up"))
map("n", "<C-Right>", function()
	require("smart-splits").resize_right()
end, desc("Resize split right"))

-- Split windows
map("n", "<leader>sj", ":split<CR><C-w>j", desc("Split window horizontal"))
map("n", "<leader>sl", ":vsplit<CR><C-w>l", desc("Split window vertical"))
map("n", "<leader>sq", ":close<CR>", desc("Close current window"))
