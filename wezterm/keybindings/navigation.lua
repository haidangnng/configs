local wezterm = require("wezterm")
local act = wezterm.action
local w = require("wezterm")

local function is_vim(pane)
	return pane:get_user_vars().IS_NVIM == "true"
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
			if is_vim(pane) then
				-- pass the keys through to vim/nvim
				win:perform_action({
					SendKey = { key = key, mods = resize_or_move == "resize" and "META" or "CTRL" },
				}, pane)
			else
				if resize_or_move == "resize" then
					win:perform_action({ AdjustPaneSize = { direction_keys[key], 3 } }, pane)
				else
					win:perform_action({ ActivatePaneDirection = direction_keys[key] }, pane)
				end
			end
		end),
	}
end

return {
	keys = {
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
		-- PANES
		{
			key = "m",
			mods = "LEADER",
			action = wezterm.action.TogglePaneZoomState,
		},
		{ key = "|", mods = "LEADER", action = act({ SplitHorizontal = { domain = "CurrentPaneDomain" } }) },
		{ key = "-", mods = "LEADER", action = act({ SplitVertical = { domain = "CurrentPaneDomain" } }) },
		{ key = "w", mods = "LEADER", action = act({ CloseCurrentPane = { confirm = true } }) },
		{
			key = "r",
			mods = "LEADER",
			action = act.ActivateKeyTable({
				name = "resize_pane",
				one_shot = false,
			}),
		},
	},

	key_tables = {
		resize_pane = {
			{ key = "h", action = act.AdjustPaneSize({ "Left", 5 }) },
			{ key = "j", action = act.AdjustPaneSize({ "Down", 5 }) },
			{ key = "k", action = act.AdjustPaneSize({ "Up", 5 }) },
			{ key = "l", action = act.AdjustPaneSize({ "Right", 5 }) },
			{ key = "q", action = "PopKeyTable" },
		},
	},
}
