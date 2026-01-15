local wezterm = require("wezterm")
local act = wezterm.action
local w = require("wezterm")

local function is_vim(pane)
	-- Check if nvim or vim is running in the pane
	local process_name = pane:get_foreground_process_name()
	
	-- Debug log
	local debug_file = io.open("/tmp/wezterm_process_check.txt", "a")
	if debug_file then
		local is_match = false
		if process_name then
			is_match = (process_name:find("vim") ~= nil) or (process_name:find("nvim") ~= nil)
		end
		debug_file:write(os.date("%Y-%m-%d %H:%M:%S") .. " - process: " .. tostring(process_name) .. " is_vim: " .. tostring(is_match) .. "\n")
		debug_file:close()
	end
	
	if process_name then
		-- Match vim or nvim specifically
		return (process_name:find("vim") ~= nil) or (process_name:find("nvim") ~= nil)
	end
	return false
end

local direction_keys = {
	h = "Left",
	j = "Down",
	k = "Up",
	l = "Right",
}

local function split_nav(resize_or_move, key)
	return {
		key = key,
		mods = resize_or_move == "resize" and "META" or "CTRL",
		action = w.action_callback(function(win, pane)
			local vim_check = is_vim(pane)
			
			-- Debug: write to file to verify this is being called
			local debug_file = io.open("/tmp/wezterm_lua_debug.txt", "a")
			if debug_file then
				debug_file:write(os.date("%Y-%m-%d %H:%M:%S") .. " - key=" .. key .. " is_vim=" .. tostring(vim_check) .. "\n")
				debug_file:close()
			end
			
			if vim_check then
				-- pass the keys through to vim/nvim
				win:perform_action({
					SendKey = { key = key, mods = resize_or_move == "resize" and "META" or "CTRL" },
				}, pane)
			else
				if resize_or_move == "resize" then
					win:perform_action({ AdjustPaneSize = { direction_keys[key], 3 } }, pane)
				else
					-- Use the navigate script for wezterm -> aerospace fallback
					local home = os.getenv("HOME")
					local script = home .. "/.config/wezterm/navigate.sh"
					local pane_id = pane:pane_id()
					
					wezterm.run_child_process({
						"bash",
						script,
						tostring(pane_id),
						key
					})
				end
			end
		end),
	}
end

return {
	-- move between split panes
	split_nav("move", "h"),
	split_nav("move", "j"),
	split_nav("move", "k"),
	split_nav("move", "l"),
	-- resize panes
	split_nav("resize", "h"),
	split_nav("resize", "j"),
	split_nav("resize", "k"),
	split_nav("resize", "l"),
	{
		key = "m",
		mods = "CMD",
		action = wezterm.action.DisableDefaultAssignment,
	},
	{
		key = "LeftArrow",
		mods = "OPT",
		action = act.SendKey({
			key = "b",
			mods = "ALT",
		}),
	},
	{
		key = "RightArrow",
		mods = "OPT",
		action = act.SendKey({ key = "f", mods = "ALT" }),
	},
	-- Disable default
	{ key = "u", mods = "CTRL|SHIFT", action = act.ScrollByPage(-0.5) },
	{ key = "d", mods = "CTRL|SHIFT", action = act.ScrollByPage(0.5) },
	-- TABS
	-- { key = 't', mods = 'LEADER', action = act({ SpawnTab = "CurrentPaneDomain"}) },
	{ key = "l", mods = "LEADER", action = act({ ActivateTabRelative = 1 }) },
	{ key = "h", mods = "LEADER", action = act({ ActivateTabRelative = -1 }) },
	-- Switch to tabs by number (Ctrl+1 through Ctrl+9)
	{ key = "1", mods = "CTRL", action = act.ActivateTab(0) },
	{ key = "2", mods = "CTRL", action = act.ActivateTab(1) },
	{ key = "3", mods = "CTRL", action = act.ActivateTab(2) },
	{ key = "4", mods = "CTRL", action = act.ActivateTab(3) },
	{ key = "5", mods = "CTRL", action = act.ActivateTab(4) },
	{ key = "6", mods = "CTRL", action = act.ActivateTab(5) },
	{ key = "7", mods = "CTRL", action = act.ActivateTab(6) },
	{ key = "8", mods = "CTRL", action = act.ActivateTab(7) },
	{ key = "9", mods = "CTRL", action = act.ActivateTab(8) },
	{
		key = "e",
		mods = "LEADER",
		action = act.PromptInputLine({
			description = "Enter new name for current TAB",
			action = wezterm.action_callback(function(window, pane, line)
				if line then
					window:active_tab():set_title(line)
				end
			end),
		}),
	},
	-- PANES
	{
		key = "m",
		mods = "LEADER",
		action = wezterm.action.TogglePaneZoomState,
	},
	{ key = "|", mods = "LEADER", action = act({ SplitHorizontal = { domain = "CurrentPaneDomain" } }) },
	{ key = "-", mods = "LEADER", action = act({ SplitVertical = { domain = "CurrentPaneDomain" } }) },
	{ key = "w", mods = "LEADER", action = act({ CloseCurrentPane = { confirm = true } }) },

	-- ACTIVATE KEY TABLE
	{
		key = "r",
		mods = "LEADER",
		action = act.ActivateKeyTable({
			name = "resize_pane",
			one_shot = false,
		}),
	},
	-- WORKSPACE
	{
		key = "s",
		mods = "LEADER",
		action = act.ShowLauncherArgs({
			flags = "FUZZY|WORKSPACES",
		}),
	},
	{
		key = "n",
		mods = "LEADER",
		action = act.PromptInputLine({
			description = wezterm.format({
				{ Attribute = { Intensity = "Bold" } },
				{ Foreground = { AnsiColor = "Fuchsia" } },
				{ Text = "Enter name for new workspace" },
			}),
			action = wezterm.action_callback(function(window, pane, line)
				if line then
					window:perform_action(
						act.SwitchToWorkspace({
							name = line,
						}),
						pane
					)
				end
			end),
		}),
	},
	{
		key = "k",
		mods = "LEADER",
		action = wezterm.action_callback(function(window)
			local w = window:active_workspace()
			local util = require("utils")
			local success, stdout = wezterm.run_child_process({ "/opt/homebrew/bin/wezterm", "cli", "list", "--format=json" })

			if success then
				local json = wezterm.json_parse(stdout)
				if not json then
					return
				end

				local workspace_panes = util.filter(json, function(p)
					return p.workspace == w
				end)

				for _, p in ipairs(workspace_panes) do
					wezterm.run_child_process({
						"/opt/homebrew/bin/wezterm",
						"cli",
						"kill-pane",
						"--pane-id=" .. p.pane_id,
					})
				end
			end
		end),
	},
	{
		key = "c",
		mods = "LEADER",
		action = act.PromptInputLine({
			description = wezterm.format({
				{ Attribute = { Intensity = "Bold" } },
				{ Foreground = { AnsiColor = "Fuchsia" } },
				{ Text = "Enter new name for workspace" },
			}),
			action = wezterm.action_callback(function(window, pane, line)
				if line then
					wezterm.mux.rename_workspace(window:active_workspace(), line)
				end
			end),
		}),
	},
}
