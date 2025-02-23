local wezterm = require("wezterm")

wezterm.on("update-right-status", function(window)
	-- "Wed Mar 3 08:14"
	local date = wezterm.strftime("%a %b %-d %H:%M ")

	local bat = ""
	for _, b in ipairs(wezterm.battery_info()) do
		local bat_icon = "󱊣"
		if b.state_of_charge * 100 >= 70 then
			bat_icon = "󱊣"
		elseif b.state_of_charge * 100 >= 40 and b.state_of_charge < 70 then
			bat_icon = "󱊢"
		elseif b.state_of_charge * 100 >= 15 and b.state_of_charge < 40 then
			bat_icon = "󱊡"
		else
			bat_icon = "󰂎"
		end

		if b.state == "Charging" then
			bat_icon = "󱐋"
		end

		bat = bat_icon .. "  " .. string.format("%.0f%%", b.state_of_charge * 100)
	end

	window:set_right_status(wezterm.format({
		{ Text = bat .. "  " .. "" .. " " .. date },
	}))
end)
